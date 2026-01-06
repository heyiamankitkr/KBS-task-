// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingsBank {
    // State variable to store the owner's address
    address  owner;
    // Constructor: Runs once when the contract is deployed
    constructor() {
        // Set the deployer of the contract as the owner
        owner = msg.sender;
    }

    // Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied: Only the owner can withdraw funds.");
        _;
    }

    // deposit(): Allows any user to send ETH to the contract
    // The 'payable' keyword allows the function to receive Ether
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        
    }

    // getBalance(): Returns the current balance of the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // withdraw(): Allows only the owner to withdraw a specific amount
    function withdraw(uint _amount) public onlyOwner {
        // The "Filter": Ensure the contract has enough funds
        require(address(this).balance >= _amount, "Insufficient funds in the vault.");

        // Transfer the amount to the owner
        // Using 'call' is the recommended way to send Ether in modern Solidity
        (bool success, ) = owner.call{value: _amount}("");
        require(success, "Transfer failed.");

        
    }
}