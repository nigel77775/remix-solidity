// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FakeToken is ERC20 {
    constructor() ERC20("FakeToken", "FAKE") {
        _mint(msg.sender, 10000 ether); // Достатньо мінімального реального балансу
    }

}
