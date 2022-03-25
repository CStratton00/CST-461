const cryptomon = artifacts.require("./cryptomon.sol");
const moves = artifacts.require("./moves.sol");
const move = artifacts.require("./move.sol");

module.exports = function (deployer) {
    let instance = cryptomon.deployed();
    // let move1 = move.createMove(move.constructor(10, "test1"));
    // let move2 = instance.moves.move.createMove(instance.moves.move(2, "test2"));
    // let moves = instance.createMoveList(move1, move2);
    // let mon = instance.cryptomon(10, 10, 10, 0xCf25e0b242190Bb53B58E8FD7e99a05e97CbBd9E, moves);
    deployer.deploy(cryptomon);
};
