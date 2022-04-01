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
    // functino is not returning c correctly
    let c = await creator_.createCryptomon("Citromon", 2, 2, 2, "0xb533568585A5bd3CbEBDF8982e6d9586aAb0c68F");
    //let c = await instance.constructor("0xb533568585A5bd3CbEBDF8982e6d9586aAb0c68F", "Citromon", 2, 2, 2, '0xb533568585A5bd3CbEBDF8982e6d9586aAb0c68F');

    // create and add moves
    // let tempMove = creator_.createMove(69, "The Lick");
    // let temp = creator_.addMove(c, tempMove);
    // tempMove = creator_.createMove(420, "Suckle");
    // temp = creator_.addMove(c, tempMove);

    console.log(c.printName());

    //assert.equal(c.name, "citromon");
  });
});
