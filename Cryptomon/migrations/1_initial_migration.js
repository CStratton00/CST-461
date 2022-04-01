//const creator = artifacts.require("./creator.sol");
const cryptomon = artifacts.require("./cryptomon.sol")
//const move = artifacts.require("./move.sol");

module.exports = function (deployer) {
    //let instance = creator.deployed();
    //deployer.deploy(creator);
    deployer.deploy(cryptomon);
};
