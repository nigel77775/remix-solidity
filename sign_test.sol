// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Test{
    bytes32 public  msgHash;
    address public controller;
    mapping(bytes32 => bool) public usedSignatures;
    address public deb_controller;

    error InvalidController();
    error SignatureAlreadyUsed();

    constructor(){
        msgHash = 0xf413212ad6f041d7bf56f97eb34b619bf39a937e1c2647ba2d306351c6d34aae;
        controller = 0x42069d82D9592991704e6E41BF2589a76eAd1A91;
    }
    function generateSPrime(bytes32 s) public pure returns (bytes32 sPrime) {
        sPrime = bytes32(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - uint256(s));
    }
    function _isValidSignature(uint8 v, bytes32 r, bytes32 s) public returns (address) {
        address _address = ecrecover(msgHash, v, r, s);
        deb_controller = _address;

        bytes32 signatureHash = keccak256(abi.encode([uint256(r), uint256(s), uint256(v)]));

        usedSignatures[signatureHash] = true;

        return _address;
    }
}