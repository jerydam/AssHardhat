// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Mapping of token balances for each address
    mapping(address => uint256) private _balances;

    // Address of the in-game store
    address public inGameStore;

    // Event to track token burn
    event Burn(address indexed burner, uint256 amount);

    // Modifiers to check if the in-game store is set
    modifier onlyInGameStore() {
        require(inGameStore != address(0), "In-game store address not set");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    // Function to mint new tokens (onlyOwner)
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    // Function to transfer tokens
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    // Function to redeem tokens for items in the in-game store
    function redeem(address recipient, uint256 amount) public onlyInGameStore returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    // Function to check token balance of an address
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    // Function to burn tokens
    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
        emit Burn(_msgSender(), amount);
    }

    // Function to set the address of the in-game store (onlyOwner)
    function setInGameStore(address _inGameStore) public onlyOwner {
        inGameStore = _inGameStore;
    }

    // Internal function to transfer tokens
    function _transfer(address sender, address recipient, uint256 amount) internal virtual override {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

}
