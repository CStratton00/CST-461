// SPDX-License-Identifier: Logan Hoots and Collin Stratton Project
pragma solidity >=0.4.22 <0.9.0;

// create contract that creates cryptomons and moves
contract creator {
    uint32 move_id;
    struct move {
        uint32 id;
        string name;
        uint32 damage;
    } mapping(uint32 => move) public movesList;

    uint32 cryptomon_id;
    struct cryptomon {
        uint32 id;
        string name;
        uint32 attack;
        uint32 defense;
        uint32 hp;
        address owner;
        move move1;
        move move2;
    } mapping(uint32 => cryptomon) public cryptomonList;

    function createCryptomon(string memory n, uint32 a, uint32 d, uint32 h) public returns (string memory) {
        uint32 ID = cryptomon_id++;
        cryptomonList[ID].id = ID;
        cryptomonList[ID].name = n;
        cryptomonList[ID].attack = a;
        cryptomonList[ID].defense = d;
        cryptomonList[ID].hp = h;
        cryptomonList[ID].owner = msg.sender;
        return string(abi.encodePacked(cryptomonList[ID].name, " created successfully!"));
    }

    function createMove(string memory n, uint32 d) public returns (string memory) {
        uint32 ID = move_id++;
        movesList[ID].id = ID;
        movesList[ID].name = n;
        movesList[ID].damage = d;
        return string(abi.encodePacked(movesList[ID].name, " created successfully!"));
    }

    function addMove(uint32 cID_, uint32 mID_) public returns (string memory) {
        move memory m = move(movesList[mID_].id, movesList[mID_].name, movesList[mID_].damage);
        if (bytes(cryptomonList[cID_].move1.name).length == 0) cryptomonList[cID_].move1 = m;
        else if (bytes(cryptomonList[cID_].move2.name).length == 0) cryptomonList[cID_].move2 = m;
        return string(abi.encodePacked(movesList[mID_].name, " added to ", cryptomonList[cID_].name, " successfully!"));
    }
}