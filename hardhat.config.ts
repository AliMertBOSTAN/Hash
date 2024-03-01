/**
 * @type import('hardhat/config').HardhatUserConfig
 */

import "hardhat-typechain";
import "@nomiclabs/hardhat-ethers";
import "hardhat-contract-sizer"
import "@nomicfoundation/hardhat-verify";

require("hardhat-storage-layout");
require('solidity-coverage')

module.exports = {
    solidity: {
      compilers: [{
        version: "0.8.20",
        settings: {
          optimizer: {
            enabled: true,
            runs: 1000000
          },
          outputSelection: {
        "*": {
            "*": ["storageLayout"],
        },
      },
        }
      }],
      overrides: {
      },
      
    },

    networks: {
       local: {
         url: 'http://127.0.0.1:8545',
         chainId: 31337,
         accounts: ["0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"]
       }
    }
};
