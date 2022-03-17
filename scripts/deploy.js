const main = async () => {
  const [deployer] = await hre.ethers.getSigners();
  const accountBalance = await deployer.getBalance();

  console.log("Deploying contracts with account: ", deployer.address);
  console.log("Account balance: ", accountBalance.toString());

  //   const erc20ContractFactory = await hre.ethers.getContractFactory("ERC20");
  //   const erc20Contract = await erc20ContractFactory.deploy("Zendus Token", "ZT");
  //   await erc20Contract.deployed();

  //   console.log("ERC20 address: ", erc20Contract.address);

  const erc721ContractFactory = await hre.ethers.getContractFactory(
    "ZendusNFT"
  );
  const erc721Contract = await erc721ContractFactory.deploy();
  await erc721Contract.deployed();

  console.log("ERC721 address: ", erc721Contract.address);

  // first mint
  let txn = await erc721Contract.mintNFT();
  await txn.wait();
  console.log("First NFT Minted");

  //Second mint
  txn = await erc721Contract.mintNFT();
  await txn.wait();
  console.log("Second NFT Minted");
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
