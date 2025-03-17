// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Factory {
    function deploy() public returns (address addr) {
        bytes memory bytecode = hex"600a600c600039600a6000f3602a60005260206000f3"; // runtime-код (10 байт)

        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))
        }
    }
}