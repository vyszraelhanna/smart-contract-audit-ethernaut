# Coin Flip Level - Exploit PoC (Proof of Concept)

## Overview
The contract uses the blockhash to generate a "random" number, this is actually not generating a random number, instead it's an easy number to find out, this is because the blockhash is public and can be seen by **anyone**.


## Vulnerabilities Highlighted 
```solidity function flip(bool _guess) public returns (bool) {
       uint256 blockValue = uint256(blockhash(block.number - 1));
        
        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR; // Critical: anyone can see the blockValue
        bool side = coinFlip == 1 ? true : false; 

        if (side == _guess) {
            consecutiveWins++;
            return true;
        } else {
            consecutiveWins = 0;
            return false;
        }
  
}
```
## Vulnerability Explained 
- Type: Predictable randomness via public blockhash.
- Root Cause: The current blockhash can be checked by anyone and the next blockhash as well, it means that anyone with this information can calculate the correct number and bypass the requirements.

- Severity: High
Attacker can predict every flip outcome and reach consecutiveWins = 10 with 100% success rate.

### Steps of the Exploit PoC

1- Call attack() function from the `CoinFlipAttack` contract multiple times.


#### Evidence 

##### Local/Foundry

- Tests passing with assertions: 
    -  assertEq(coinFlip.consecutiveWins(), 10);
    ![alt text](image.png)

##### Real Testnet (Sepolia)
- [Transaction calling Attack():](https://sepolia.etherscan.io/tx/0xb6553f4d14c4e16214f2939cc7ca818c3589806edf6dfd472e1057294fb2296e)
- [Attack Contract Adddress:](https://sepolia.etherscan.io/address/0x09AABab8150e95D5ed5a7b840cF1256e125C5f16)

## Recommended Mitigation
- Use an off-chain oracle service like - [Chainlink VRF():](https://docs.chain.link/vrf)

## Lessons Learned

- We must never use a public value to determine or calculate a random value.
- Always use the off-chain oracles or on-chain VRF solutions to generate random numbers.

## Files
- [Attacker Contract Code](../../src/coinFlip/CoinFlipAttack.sol)
- [Exploit Test Code](../../test/coinFlip/CoinFlipTest.t.sol)
- [Broadcast Script](../../script/coinFlip/CoinFlipComplete.s.sol)

This is a full Exploit PoC: reproduced locally with Foundry, broadcasted on Sepolia testnet.