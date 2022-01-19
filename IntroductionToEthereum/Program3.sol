// SPDX-License-Identifier: Collin Stratton
pragma solidity ^0.8.10;

contract Store {
    uint money = 0;
    uint shirtPrice = 10;
    uint pantsPrice = 20;

    function addFunds(uint amount) public {
        money += amount;
    }

    function totalMoney() public view returns (uint) {
        return money;
    }

    function buyShirt() public payable {
        if (shirtPrice <= money) {
            money -= shirtPrice;
        }
    }

    function buyPants() public payable {
        if (pantsPrice <= money) {
            money -= pantsPrice;
        }
    }

    function buyOutfit() public payable {
        if (shirtPrice + pantsPrice <= money) {
            money -= shirtPrice + pantsPrice;
        }
    }
}