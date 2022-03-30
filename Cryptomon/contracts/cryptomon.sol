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

    // constructor() {
    //     attack = 0;
    //     defense = 0;
    //     hp = 0;
    //     owner = 0xCf25e0b242190Bb53B58E8FD7e99a05e97CbBd9E;
    //     attacks = []
    // }

    constructor(string memory name_, uint32 attack_, uint32 defense_, uint32 hp_, address owner_/*, moves[] memory attacks_*/) {
        name = name_;
        attack = attack_;
        defense = defense_;
        hp = hp_;
        owner = owner_;
        //attacks = attacks_;
    }

    // add move
    // function addMove(move move_) public returns () {
    //     attacks.push(move_);
    // }
}