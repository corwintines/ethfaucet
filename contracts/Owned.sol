//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Owned {
    address payable owner;

    // Constructor to set owner of contract as the address the contract is deployed from
    constructor () {
        owner = payable(msg.sender);
    }

    // Require that the the msg.sender is the owner of contract before running method.
    modifier onlyOwner () {
        require(msg.sender == owner, "You are not the owner of this contract");
        _;
    }
}