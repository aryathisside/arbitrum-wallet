const hre = require("hardhat")

async function main() {
    
  // Setup accounts & variables
  const [deployer] = await ethers.getSigners()

  // Deploy contract
  const DomainRegistry = await ethers.getContractFactory("DomainRegistry")
  const domainRegistry = await DomainRegistry.deploy()
  
  const domainRegistrytAddress = await domainRegistry.getAddress()
  console.log(`Deployed DomainRegistry Contract at: ${domainRegistrytAddress}\n`)
  
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});