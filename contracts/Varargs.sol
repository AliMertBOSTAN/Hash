//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

pragma solidity ^0.8.0;

contract StringToUint {
    function stringToUint(string memory _str) public pure returns (uint256) {
        bytes memory b = bytes(_str);
        uint256 result = 0;
        for (uint256 i = 0; i < b.length; i++) {
            if (uint8(b[i]) >= 48 && uint8(b[i]) <= 57) {
                result = result * 10 + (uint8(b[i]) - 48);
            }
        }
        return result;
    }
}

contract varargs is StringToUint{

    modifier Log(bytes memory _data) {
        require(_data.length >= 32, "Invalid data length");

        uint256 numStrings = _data.length / 32;
        string[] memory strings = new string[](numStrings);
        uint256 ptr;
        assembly {
            ptr := add(_data, 32)
        }

        for (uint256 i = 0; i < numStrings; i = i++) {
            uint256 len;
            assembly {
                len := mload(ptr)
            }
            bytes memory strBytes = new bytes(len);

            assembly {
                let dataPtr := add(ptr, 32)
                for { let j := 0 } lt(j, len) { j := add(j, 1) } {
                    mstore(add(strBytes, add(32, j)), mload(add(dataPtr, j)))
                }
            }
            strings[i] = string(strBytes);
            ptr += 32 + len;
            console.log("%s" ,strings[i]);
        }
        _;
    }

    function test1(address _address) public Log(abi.encode(Strings.toHexString(uint256(uint160(_address)), 20)))  returns (address) {
        return _address;
    }

    function test2(uint _uint) public Log(abi.encode(stringToUint(Strings.toString(_uint)))) returns (uint) {
        return _uint;
    } 

    function test3(string memory _string) public Log(abi.encode(_string)) returns (string memory) {
        return _string;
    }

    function test4(string memory _string, uint _uint) public Log(abi.encode(_string, Strings.toString(_uint))) returns (string memory) {
        return _string;
    }
 
}