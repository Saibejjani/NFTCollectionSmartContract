const main = async () => {
  const contractFactory = await hre.ethers.getContractFactory("NFTGenrator");
  const nftContract = await contractFactory.deploy();
  await nftContract.deployed();

  console.log("Your contract address is : ", nftContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
