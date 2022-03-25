const cryptomon = artifacts.require("./cryptomon.sol");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract('cryptomon', async accounts => {
  it("should assert true", async () => {
    let instance = await cryptomon.deployed();
    let moves = await instance.createMoveList(instance.move(10, "test1"), instance.move(5, "test2"));
    let mon = await instance.cryptomon(10, 10, 10, 0xCf25e0b242190Bb53B58E8FD7e99a05e97CbBd9E, moves);
    assert.equal(mon.attack, 10);
  });
});
