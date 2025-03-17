// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract StorageReader22 {
    address public timeZone1Library;
    address public timeZone2Library;
    uint256 public owner2;

    function setTime(uint256 _time) public {
        owner2 = _time;
    }
}
