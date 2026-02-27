//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../../src/coinFlip/CoinFlip.sol";
import "../../src/coinFlip/CoinFlipAttack.sol";

contract CoinFlipTest is Test {
    CoinFlip coinFlip;
    CoinFlipAttack coinAttack;
    address deployer;
    address attacker;

    function setUp() external {
        deployer = makeAddr("deployer");
        attacker = makeAddr("attacker");

        vm.deal(deployer, 10 ether);
        vm.deal(attacker, 10 ether);

        vm.prank(deployer);
        coinFlip = new CoinFlip();

        vm.prank(attacker);
        coinAttack = new CoinFlipAttack(address(coinFlip));
    }

    function test_attack() external {
         
        for (uint256 i = 0; i < 10; i++) {
            vm.roll(i + 1);
            coinAttack.attack();
        }
        assertEq(coinFlip.consecutiveWins(), 10);
    }
}
