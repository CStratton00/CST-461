//const cryptomon = artifacts.require("./cryptomon.sol");
const creator = artifacts.require("./creator.sol");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */

contract('cryptomon', async accounts => {
  it("should assert true", async () => {
    let instance = await creator.deployed();
    let cryptomonID = await instance.createCryptomon("Citromon", 10, 10, 10);
    let c = await instance.cryptomonList(0);

    assert.equal(c[1], "Citromon");
  });

  it("should assert true", async () => {
    let instance = await creator.deployed();
    let moveID = await instance.createMove("The Lick", 10);
    let m = await instance.movesList(0);
    assert.equal(m[1], "The Lick");
  });

  it("should assert true", async () => {
    let instance = await creator.deployed();
    let cryptomonID = await instance.createCryptomon("Citromon", 10, 10, 10);
    let moveID = await instance.createMove("The Lick", 10);
    let m = await instance.movesList(0);
    let temp = await instance.addMove(0, 0);
    let c = await instance.cryptomonList(0);

    assert.equal(c[6][1], "The Lick");
  })
});
