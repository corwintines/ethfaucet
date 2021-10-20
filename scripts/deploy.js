const main = async () => {
  const ethFaucetContractFactory = await hre.ethers.getContractFactory('EthFaucet');
  const ethFaucetContract = await ethFaucetContractFactory.deploy();
  await ethFaucetContract.deployed();
  console.log("Contract deployed to:", ethFaucetContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
