const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();

  console.log("Deploying contracts with account: ", deployer.address);
  console.log("Account balance: ", accountBalance.toString());

  const erc20ContractFactory = await hre.ethers.getContractFactory("ERC20");
  const erc20Contract = await erc20ContractFactory.deploy("Zendus Token", "ZT");
  await erc20Contract.deployed();

  console.log("ERC20 address: ", erc20Contract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (err) {
    console.log(err);
    process.exit(1);
  }
};

runMain();
