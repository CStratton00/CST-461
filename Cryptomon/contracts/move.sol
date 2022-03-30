// SPDX-License-Identifier: Logan Hoots and Collin Stratton Project
pragma solidity >=0.4.22 <0.9.0;

contract move {
    uint32 moveID;
    uint32 damage;
    string name;

    constructor(uint32 moveID_, uint32 damage_, string memory name_) {
        moveID = moveID_;
        damage = damage_;
        name = name_;
    }
    //function createMove(move m_) public pure returns (move m) { m = m_; }
}