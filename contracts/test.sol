//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Hash {
   function outputHash() public pure returns (bytes32) {
     return keccak256("Test");
   }
  function EncodePacked() public pure returns (bytes memory) {
     return abi.encodePacked("Test", "test");
   }
  function Encode() public pure returns (bytes memory) {
     return abi.encode("Test","meeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeert","Test");
   }
}