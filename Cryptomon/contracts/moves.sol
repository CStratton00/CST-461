// SPDX-License-Identifier: Logan Hoots and Collin Stratton Project
pragma solidity >=0.4.22 <0.9.0;

contract moves {
    function createMoveList(move move1, move move2) public pure returns (move[] memory m) {
        m[0] = move1;
        m[1] = move2;
    }
}

contract move {
    uint32 damage;
    string name;

    constructor(uint32 damage_, string memory name_) {
        damage = damage_;
        name = name_;
    }

    function createMove(move m_) public pure returns (move m) { m = m_; }
}