//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/force/Force.sol";
import "src/force/ForceAttack.sol";

contract ForceTest is Test {
    address attacker;
    Force force;
    ForceAttack forceAttack;

    function setUp() external {
        attacker = makeAddr("attacker");
        vm.deal(attacker, 1 ether);

        force = new Force();
        forceAttack = new ForceAttack();
    }

    function test_attack() external {
        vm.prank(attacker);
        forceAttack.attack{value: 1 ether}(payable(address(force)));
        assertGt(address(force).balance, 0);
    }
}