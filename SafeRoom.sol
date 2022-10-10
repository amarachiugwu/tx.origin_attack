// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract SafeRoom {
    
    address payable public owner;
    uint public initialBal;
    
    constructor() payable {
        initialBal = msg.value;
        owner = payable(msg.sender);
    }
    
    
    function transfer (address _to, uint amount) public  {
        require(tx.origin == owner, 'You are not the owner');
        (bool success,) = _to.call{value:amount}("");
        require(success, "Transfer Failed");
    }

    function getBalance() public view returns (uint bal){
        bal = address(this).balance;
    }
}