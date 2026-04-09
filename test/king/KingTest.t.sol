//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "src/king/King.sol";
import "src/king/KingAttack.sol";

contract KingTest is Test {
    address deployer;
    King king;
    KingAttack attack;

    function setUp() public {
        deployer = makeAddr("deployer");
        vm.deal(deployer, 10 ether);
        vm.prank(deployer);
        king = new King{value: 1 ether}();
    }

    function test_attack() public {
        KingAttack kingAttack = new KingAttack();
        vm.deal(address(kingAttack), 2 ether);
        kingAttack.attack{value: 2 ether}(payable(address(king)));
        assertEq(king._king(), address(kingAttack));
        vm.prank(deployer);
        vm.expectRevert();
        (bool success, ) = address(king).call{value: 1 ether}("");
    }

}