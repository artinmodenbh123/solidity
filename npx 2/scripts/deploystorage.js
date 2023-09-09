const hre = require("hardhat");

async function main() {
  const storage = await hre.ethers.deployContract("Simple_Storage");

  await storage.waitForDeployment();

  console.log(
    `Storage contract deployed to ${storage.target}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
