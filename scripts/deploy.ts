const hre = require("hardhat");

async function main() {
  // Get the Points smart contract
  const deploy = await hre.ethers.getContractFactory("DegenGamingToken");

  // Deploy it
  const points = await deploy.deploy();
  await points.waitForDeployment();

  // Display the contract address
  console.log(`DegenGamingToken token deployed to ${points.target}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
