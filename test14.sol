// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GasConsumption {


    receive() external payable{
        uint256 gasLeft = gasleft();
        while (gasLeft > 0) {
            gasLeft = gasleft();
        }
    }
}
