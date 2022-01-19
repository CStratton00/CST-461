// SPDX-License-Identifier: Collin Stratton
pragma solidity ^0.8.10;

contract simpleVoter {
    uint voteA = 0;
    uint voteB = 0;

    function voteForA() public {
        voteA++;
    }

    function voteForB() public {
        voteB++;
    }

    function totalVotesA() public view returns (uint) {
        return voteA;
    }

    function totalVotesB() public view returns (uint) {
        return voteB;
    }

    function winner() public view returns (string memory) {
        if (voteA > voteB) {
            return "A";
        } else if (voteB > voteA) {
            return "B";
        } else {
            return "Tie"; 
        }
    }
}