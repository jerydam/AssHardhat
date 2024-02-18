// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    constructor() ERC20("DegenGamingToken", "DGT") Ownable(msg.sender) {}

    // Mint new tokens. Only the owner can call this function.
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Transfer tokens to another address.
    function transferTokens(address to, uint256 amount) external {
        _transfer(msg.sender, to, amount);
    }

    // Redeem tokens for items in the in-game store.
    function redeem(address player, uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(player) >= amount, "Insufficient balance for redemption");

        // Add specific logic for redemption (e.g., updating in-game store items, etc.).

        // Subtract redeemed tokens from player's balance
        _burn(player, amount);
    }

    // Check token balance of a specific address.
    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Burn tokens. Anyone can burn their own tokens.
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
