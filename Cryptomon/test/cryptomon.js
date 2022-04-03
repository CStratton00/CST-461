const cryptomon = artifacts.require("./cryptomon.sol");
const creator = artifacts.require("./creator.sol");
//const move = artifacts.require("./move.sol");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */

contract('cryptomon', async accounts => {
  it("should assert true", async () => {
    let instance = await cryptomon.deployed();
    let creator_ = await creator.deployed();
    //let move = await move.deployed();

    // create cryptomon
    // function is not returning c correctly
    let c = await creator_.createCryptomon("Citromon", 2, 2, 2, "0x8A982bd4d492c2f8e169FC01c259FA3f6a5fFe6d");
    //console.log();
    //let c = await instance.constructor("0xb533568585A5bd3CbEBDF8982e6d9586aAb0c68F", "Citromon", 2, 2, 2, '0xb533568585A5bd3CbEBDF8982e6d9586aAb0c68F');
    let d = await creator_.asdf();
    // let e = await d[0].name;

    // create and add moves
    // let tempMove = creator_.createMove(69, "The Lick");
    // let temp = creator_.addMove(c, tempMove);
    // tempMove = creator_.createMove(420, "Suckle");
    // temp = creator_.addMove(c, tempMove);

    //let s = await c.methods.printName().call();
    
    console.log(d[0].name + " " + d[0].attack);

    //assert.equal(c.name, "Citromon");
  });
});
