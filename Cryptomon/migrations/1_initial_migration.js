const creator = artifacts.require("./creator.sol");
// const cryptomon = artifacts.require("./cryptomon.sol")
//const move = artifacts.require("./move.sol");

module.exports = function (deployer) {
    deployer.deploy(creator);
    // deployer.deploy(cryptomon, "Citromon", 2, 2, 2, "0x1ADE4fa56c1175B4155a49368f3F550CEc3d2dCc");

    let instance = await creator.deployed();

    // deploy a cryptomon
    // let cryptomonID = await instance.createCryptomon("Citromon", 10, 10, 10);
    // let moveID = await instance.createMove("The Lick", 10);
    // moveID = await instance.createMove("Suckle", 69);
    // let temp = await instance.addMove(0, 0);
    // temp = await instance.addMove(0, 1);

    // let cryptomonID2 = await instance.createCryptomon("Citromon2", 10, 10, 10);
    // let moveID2 = await instance.createMove("The Lick2", 10);
    // moveID2 = await instance.createMove("Suckle2", 69);
    // let temp2 = await instance.addMove(1, 2);
    // temp2 = await instance.addMove(1, 3);
};
