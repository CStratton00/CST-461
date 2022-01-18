// SPDX-License-Identifier: Collin Stratton
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    uint size = 0;
    uint[] storedData = new uint[](size);

    function append(uint x) public {
        storedData.push(x);
    }

    function getArr() public view returns (uint[] memory) {
        return storedData;
    }

    function sum() public view returns (uint) {
        uint result = 0;
        for (uint i = 0; i < storedData.length; i++) {
            result += storedData[i];
        }
        return result;
    }

    function removeAt(uint pos) public {
        delete storedData[pos];
    }
}