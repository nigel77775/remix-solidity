// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGatekeeperTwo {
    function approve(address _spender, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
}

contract GatekeeperTwoAttack {
    IGatekeeperTwo public ethernautInstance;

    constructor (address instanceAddress) {
        ethernautInstance = IGatekeeperTwo(instanceAddress);
    }
}
