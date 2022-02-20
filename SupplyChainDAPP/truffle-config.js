const HDWalletProvider = require("@truffle/hdwallet-provider");
var mnemonic = "YOUR MNEMONIC FROM YOUR WALLET (MetaMask)";

module.exports = {
  networks: {
   development: {
    host: "127.0.0.1",
    port: 7545,
    network_id: "*"
   },
   ropsten: {
       provider: function() { 
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/db7278945d1741a4963fdcaa6a0c47e6");
       },
       network_id: 3,
       gas: 4500000,
       gasPrice: 10000000000,
   },compilers: {
    solc: {
      version: "0.5.0",    // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // settings: {          // See the solidity docs for advice about optimization and evmVersion
      //  optimizer: {
      //    enabled: false,
      //    runs: 200
      //  },
      //  evmVersion: "byzantium"
      // }
    }
  },
   live: {
    provider: function() { 
     return new HDWalletProvider(mnemonic, "https://mainnet.infura.io/v3/db7278945d1741a4963fdcaa6a0c47e6");
    },
    network_id: 1,
    gas: 7500000,
    gasPrice: 10000000000,
}
  }
 };