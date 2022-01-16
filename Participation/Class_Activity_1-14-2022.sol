// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Summation {

    uint[10] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function sum() public view returns (uint) {
        uint result = 0;
        for (uint i = 0; i < numbers.length; i++) {
            result += numbers[i];
        }
        return result;
    }
}