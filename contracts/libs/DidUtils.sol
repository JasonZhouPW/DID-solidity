// SPDX-License-Identifier: LGPL-3.0-or-later
pragma solidity >=0.6.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "./BytesUtils.sol";

library DidUtils {

    // example: did:eth:0x5Ee76017be7F983a520a778B413758A9DB49cBe9, did:eth:5Ee76017be7F983a520a778B413758A9DB49cBe9
    /**
   * @dev verify did format
   * @param did did
   */
    function verifyDIDFormat(string memory did) public pure returns (bool){
        bytes memory didData = bytes(did);
        if (didData.length < 48) {
            return false;
        }
        bytes memory prefix = bytes("did:eth:");
        if (!BytesUtils.equal(BytesUtils.slice(didData, 0, prefix.length), prefix)) {
            return false;
        }
        bytes memory addressBytesData = BytesUtils.slice(didData, prefix.length, didData.length - prefix.length);
        bytes memory addressBytes = BytesUtils.fromHex(string(addressBytesData));
        return addressBytes.length == 20;
    }

    /**
   * @dev parse public key to address
   * @param pubKey public key
   */
    function pubKeyToAddr(bytes memory pubKey) public pure returns (address){
        return address(uint(keccak256(pubKey)));
    }
}