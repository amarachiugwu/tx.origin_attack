// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract SafeRoom {
    
    address public owner;
    uint public initialBal;
    
    constructor (_initialBal) {
        assert(msg.value == _initialBal);
        owner = msg.sender;
    }
    
    
    function transfer (_to, amount) {
        assert(tx.origin == owner);
        (success,) = call{value:initialBal}("");
        require(success, "Transfer Failed");
    }
}