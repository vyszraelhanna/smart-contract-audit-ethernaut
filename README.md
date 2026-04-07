# Ethernaut Exploit & Security Reports

Personal project solving Ethernaut levels (OpenZeppelin) using Foundry PoCs. Focus on understanding vulnerabilities, reproducing exploits locally/forked and documenting risks + recommended mitigations.

## Solved Levels

- [Fallback](docs/fallback/README.md) -> Ownership takeover via permissive receive();

- [Fallout](docs/fallout/README.md) -> Fake constructor ('Fal1out') allowing anyone to become owner.

- [Coin Flip](docs/coinFlip/README.md) -> The contract relies on blockhash to generate a pseudo-random number.

- [Telephone](docs/telephone/README.md) -> The contract relies only in the check `tx.origin != msg.sender` for access verification.

- [Token](docs/token/README.md) -> The function does not validate if `_value` is greater than `balances[msg.sender]`. When a `uint256`goes below zero, it wraps around to `type(uint256).max`, giving the attacker an enormous balance.

- [Vault](docs/vault/README.md) -> The vault contract has a property `password` marked as `private`.

## General Vulnerability & Risk Report
Here is a summary of the main bugs found in the solved levels:

| Level | Main Vulnerability | Severity | Main Impact | Recommended Mitigation 
| ----- | ----- | ----- | ----- | ----------------- |
|Fallback | Permissive receive() | High | Ownership takeover with 1 wei + full drain | Remove or protect  receive(). |
|Fallout | "Fal1out" function ( typo ) | High | Anyone can become owner and drain funds | Use `constructor()` instead of a function. 
|Coin Flip | Blockhash to generate a pseudo-random number | High | `blockhash`is a public value accessible to **anyone** on the blockchain, making the outcome fully predictable. | Always rely on off-chain oracles or on-chain VRF solutions for unpredictable and tamper-resistant random number generation. 
|Telephone| Ownership takeover via intermediary contract call. | Hight | The contract has a function called `changeOwner()` that allows ownership to be transferred to anyone, as long as the call comes from an intermediary contract | Never rely on `tx.origin` for access control, as any intermediary contract can bypass it.
|Token | Integer Underflow. | High | The function does not validate if `_value` is greater than `balances[msg.sender]`. When a `uint256` goes below zero, it wraps around to `type(uint256).max`, giving the attacker an enormous balance. | In older versions (`^0.6.0 ` and below), always use OpenZeppelin's SafeMath library
|Vault| Sensitive Data Exposure | Hight | Anyone can read the password directly from the storage and call `unlock()` with the correct value, unlocking the contract without authorization.



For full details (PoC, exploit steps, on-chain), click in the links above.

## How to run the tests
```bash 
# Example for fallback level (adjust path as needed)
forge test --match-path "test/fallback/*" -vvvv 
```

## Tools & Setup 

- Foundry
- Sepolia testnet

Contributions, suggestions, or questions are welcome!