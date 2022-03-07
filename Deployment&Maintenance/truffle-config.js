const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = "rebel silly diary soap metal usage veteran wrestle repeat fragile heart service";

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    ropsten: {
      provider: function() { 
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/733d2cc91b154ca2a8d044c1611afd84");
      },
      network_id: 3,
      gas: 4500000,
      gasPrice: 10000000000,
    },
    live: {
      provider: function() { 
        return new HDWalletProvider(mnemonic, "https://mainnet.infura.io/v3/733d2cc91b154ca2a8d044c1611afd84");
      },
      network_id: 1,
      gas: 7500000,
      gasPrice: 10000000000,
    }
  }
};