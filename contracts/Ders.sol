//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Deneme {

    string text; // public bir değişken ve sözleşmenin diğer bölümleri taradından kullanılabilir

    constructor(string memory _data){
        text = _data;
        console.log("input text is %s", _data);
       
    }

    function print() public view returns(string memory) {
        return text;
    }
}