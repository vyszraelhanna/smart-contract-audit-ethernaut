//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../../src/coinFlip/CoinFlipAttack.sol";

contract CoinFlipComplete is Script { 
    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address attackerContract = 0x09AABab8150e95D5ed5a7b840cF1256e125C5f16;
        CoinFlipAttack attacker = CoinFlipAttack(attackerContract);
        attacker.attack();
        vm.stopBroadcast();
    }
}