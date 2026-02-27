//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../../src/coinFlip/CoinFlipAttack.sol";

contract FlipAttack is Script {
    
    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address levelAddress = 0x799A35895b12B58Bd988B42a07593ff955b6bb0E;
        CoinFlipAttack attacker = new CoinFlipAttack(levelAddress);
        attacker.attack();
        
        vm.stopBroadcast();
    }
}   