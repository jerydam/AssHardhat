// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    mapping(uint256 => uint256) public itemPrices; // Mapping of item IDs to their prices
    mapping(uint256 => string) public itemNames; // Mapping of item IDs to their names

    constructor() ERC20("DegenGamingToken", "DGT") Ownable(msg.sender) {
        // Define the prices and names of items in the constructor
        itemPrices[1] = 100; // Item with ID 1 costs 100 DGT tokens
        itemNames[1] = "Sword"; // Item with ID 1 is a Sword
        itemPrices[2] = 200; // Item with ID 2 costs 200 DGT tokens
        itemNames[2] = "Shield"; // Item with ID 2 is a Shield
        // Add more items and their prices as needed
    }

    // Mapping to keep track of claimed items by address
    mapping(address => mapping(uint256 => bool)) public claimedItems;

    // Mint new tokens. Only the owner can call this function.
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Transfer tokens to another address.
    function transferTokens(address to, uint256 amount) external {
        _transfer(msg.sender, to, amount);
    }

    // Redeem tokens for items in the in-game store.
    function redeem(uint256 itemId) external {
        address player = msg.sender; // Set player to the address of the caller
        require(itemPrices[itemId] > 0, "Invalid item ID"); // Check if the item ID is valid
        require(balanceOf(player) >= itemPrices[itemId], "Insufficient balance for redemption");
        require(!claimedItems[player][itemId], "Item already claimed");

        // Add specific logic for redemption based on the itemId (e.g., granting items to the player, updating in-game store items, etc.).

        // Mark the item as claimed for the player
        claimedItems[player][itemId] = true;

        // Subtract redeemed tokens from player's balance
        _burn(player, itemPrices[itemId]);
    }

    // Check token balance of a specific address.
    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Burn tokens. Anyone can burn their own tokens.
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Add new items to the in-game store
    function addItem(uint256 itemId, uint256 price, string memory name) external onlyOwner {
        require(itemId > 0, "Invalid item ID");
        require(price > 0, "Invalid price");
        require(bytes(name).length > 0, "Invalid name");

        itemPrices[itemId] = price;
        itemNames[itemId] = name;
    }
}
