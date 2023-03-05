// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// DO NOT USE IN PRODUCTION
contract TinyOwnable {
    address public owner;

    event NewOwner(address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner Can Call");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setNewOwner(address newOwner) external onlyOwner {
        require(newOwner != owner, "Cannot Set To Yourself");

        owner = newOwner;

        emit NewOwner(newOwner);
    }
}
