
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    bnbtestnet : {
      url: "https://bsc-testnet.publicnode.com",
      accounts: ['2a019d1860eae9683473152c2b4cde959ddb910f20d97c14458c1002617e94a3']
    }
  }
};


