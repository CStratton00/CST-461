const creator = artifacts.require("./creator.sol");
const cryptomon = artifacts.require("./cryptomon.sol")
//const move = artifacts.require("./move.sol");

module.exports = function (deployer) {
    //let instance = creator.deployed();
    deployer.deploy(creator);
    //console.log("sa");
    deployer.deploy(cryptomon, "Citromon", 2, 2, 2, "0xb533568585A5bd3CbEBDF8982e6d9586aAb0c68F");
    //console.log("fdsahf;");
};
