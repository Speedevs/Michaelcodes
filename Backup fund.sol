// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// code by speedevs
contract SimpleWallet {
    address public owner;
    mapping(address => uint256) public balances;

    event Deposit(address indexed depositor, uint256 amount);
    event Withdrawal(address indexed withdrawer, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
// Code by RN CEO 
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
// Give credits , Don't steal seriously Karmar exist
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(amount <= balances[msg.sender], "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
// This code was written by Rich Nation CEO 