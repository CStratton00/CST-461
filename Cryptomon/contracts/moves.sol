// SPDX-License-Identifier: Logan Hoots and Collin Stratton Project
pragma solidity >=0.4.22 <0.9.0;
import "./move.sol";

contract moves {
    function createMoveList(move move1, move move2) public pure returns (move[] memory m) {
        m[0] = move1;
        m[1] = move2;
    }
}