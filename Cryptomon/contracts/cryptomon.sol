// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract cryptomon {

    struct move {
        uint32 damage;
        string name;
    }

    uint32 attack = 0;
    uint32 defense = 0;
    uint32 hp = 0;
    address owner;
    move[] attacks;

    constructor() {

    }
}