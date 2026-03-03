// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../../src/telephone/Telephone.sol";
import "../../src/telephone/TelephoneAttack.sol";

contract TelephoneTest is Test {
    address deployer;
    address attacker;
    Telephone telephone;
    TelephoneAttack telephoneAttack;

    function setUp() public {
        deployer = makeAddr("deployer");
        attacker = makeAddr("attacker");

        vm.prank(deployer);
        telephone = new Telephone();

        telephoneAttack = new TelephoneAttack(address(telephone));
    }
    
    function test_attack() public {
        vm.prank(attacker);
        telephoneAttack.attack(attacker);
    }
}

feat: add Telephone level contract, attack, script and test.