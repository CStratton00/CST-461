// SPDX-License-Identifier: Collin Stratton
pragma solidity >=0.7.0 <0.9.0;

contract Calculator {
    function add(uint a, uint b) public view returns (uint) {
        return a + b;
    }

    function subtract(uint a, uint b) public view returns (uint) {
        return a - b;
    }

    function multiply(uint a, uint b) public view returns (uint) {
        return a * b;
    }

    function divide(uint a, uint b) public view returns (uint) {
        return a / b;
    }
}