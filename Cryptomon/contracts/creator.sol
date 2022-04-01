// SPDX-License-Identifier: Logan Hoots and Collin Stratton Project
pragma solidity >=0.4.22 <0.9.0;
import "./cryptomon.sol";

// create contract that creates cryptomons and moves
contract creator {
    // create list of cryptomon
    cryptomon[] cryptomonList;
    // create list of moves
    move[] movesList;
    
    // create cryptomon and add it to a list of cryptomon
    function createCryptomon(string memory name, uint32 attack, uint32 defense, uint32 hp, address owner) public returns (cryptomon c) {
        c = new cryptomon(name, attack, defense, hp, owner);
        cryptomonList.push(c);
    }
    
    // create move
    function createMove(uint32 damage, string memory name) public returns (move m) {
        m = new move(uint32(uint256(movesList.length)), damage, name);
        movesList.push(m);
    }

    // add additional moves to cryptomon
    function addMove(cryptomon cryptomon_, move move_) public {
        cryptomon_.addMove(move_);
    }
}