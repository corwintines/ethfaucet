//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./Owned.sol";

contract EthFaucet is Owned {
    mapping(address => bool) hasWithdrawn;

    // Contract destructor. Inherits owner from Owned contract
    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    // Withdraw withdraw_amount from contract to msg.sender
    function withdrawal (uint withdraw_amount) public {
        // Limit withdrawal amount to 1 ETH
        require(withdraw_amount <= 1 ether);
        // Require that the balance of the contract is greater than the withdraw_amount
        require(address(this).balance > withdraw_amount, "Not enough ether in faucet");
        // Require msg.sender to have not withdrawn before
        require(!hasWithdrawn[msg.sender], "You have already withdrawn from this faucet");

        // Send withdraw_amount to msg.sender
        payable(msg.sender).transfer(withdraw_amount);
    }

    // Add funds to contract
    receive() external payable {}
}
