import { ethers } from "hardhat";
import { Varargs } from "../typechain";

async function main() {

  let factory = await ethers.getContractFactory("varargs")
  let dene = await factory.deploy() as Varargs
  dene.test2(1110201002)
  dene.test2(6554)

  dene.test3("test")
  dene.test3("TEST")
  dene.test3("hello")

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
