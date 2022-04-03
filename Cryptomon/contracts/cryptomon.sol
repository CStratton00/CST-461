// SPDX-License-Identifier: Logan Hoots and Collin Stratton Project
pragma solidity >=0.4.22 <0.9.0;
import "./move.sol";

contract cryptomon {
    string name = "";
    uint32 attack = 0;
    uint32 defense = 0;
    uint32 hp = 0;
    address owner;
    move[] attacks;

    constructor(string memory name_, uint32 attack_, uint32 defense_, uint32 hp_, address owner_) {
        name = name_;
        attack = attack_;
        defense = defense_;
        hp = hp_;
        owner = owner_;
    }

    function addMove(move m) public { attacks.push(m); }

    function printName() public view returns (string memory name_) { name_= name; }
}