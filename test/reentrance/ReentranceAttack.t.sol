//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "src/reentrance/Reentrance.sol";
import "src/reentrance/ReentranceAttacker.sol";

contract ReentrancyAttack is Test {
    
    address attacker;
    Reentrance reentrance;
    ReentranceAttacker attack;

    function setUp() public {
        attacker = makeAddr("attacker");
        reentrance = new Reentrance();
        attack = new ReentranceAttacker(payable(reentrance));
        
        vm.deal(attacker, 1 ether);
        vm.deal(address(reentrance), 10 ether);
    }

    function test_attack() public {
       vm.prank(attacker);
       attack.attack{value: 1 ether}();

       assertEq(address(reentrance).balance, 0);
       assertGt(address(attack).balance, 0);
    }
}