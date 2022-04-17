const creator = artifacts.require("./creator.sol");

module.exports = async function (deployer) {
    await deployer.deploy(creator);
    const instance = await creator.deployed();
    const fs = require('fs');

    // deploy a cryptomon
    let cryptomonID = await instance.createCryptomon("Citromon", 10, 10, 10);
    let moveID = await instance.createMove("The Lick", 10, 100);
    moveID = await instance.createMove("Suckle", 69, 30);
    let temp = await instance.addMove(0, 0);
    temp = await instance.addMove(0, 1);

    let cryptomonID2 = await instance.createCryptomon("Citromon2", 10, 10, 10);
    let moveID2 = await instance.createMove("The Lick2", 10, 100);
    moveID2 = await instance.createMove("Suckle2", 69, 30);
    let temp2 = await instance.addMove(1, 2);
    temp2 = await instance.addMove(1, 3);

    // get cryptomon from list
    let c = await instance.cryptomonList(0);
    let c2 = await instance.cryptomonList(1);

    // get moves from list
    let m = await instance.movesList(0);
    let m2 = await instance.movesList(1);

    // console.log(c[1] + " " + c2[1]);
    // console.log(c[6][1] +  " " + c[7][1]);
    // console.log(c2[6][1] + " " + c2[7][1]);

    const content = instance.ToString(c[0]);

    fs.writeFile('../Cryptomon/Assets/Scripts/deploy.txt', content, err => {
        if (err) {
          console.error(err)
          return
        }
        //file written successfully
    });
};
