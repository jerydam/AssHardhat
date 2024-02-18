# DegenGamingToken (DGT) - ERC-20 Token

## Introduction

DegenGamingToken (DGT) is an ERC-20 token deployed on the Ethereum blockchain. It serves as the native token for the Degen Gaming platform, providing various functionalities for players and the in-game ecosystem.

## contract address: https://testnet.snowtrace.io/address/0x90A77A567C4Ebc6C1fEf3DcBdc61Ff94F1a16eA2#code
## Token Information

- **Name**: DegenGamingToken
- **Symbol**: DGT

## Smart Contract Features

### Minting New Tokens

New tokens can be minted and distributed to players as rewards. Only the owner of the smart contract has the authority to mint new tokens.

```solidity
function mint(address to, uint256 amount) external onlyOwner {
    _mint(to, amount);
}
```

### Transferring Tokens

Players can transfer their tokens to others using the `transferTokens` function.

```solidity
function transferTokens(address to, uint256 amount) external {
    _transfer(msg.sender, to, amount);
}
```

### Redeeming Tokens

Players can redeem their tokens for items in the in-game store. The `redeem` function checks if the player has a sufficient balance before allowing the redemption.

```solidity
function redeem(address player, uint256 amount) external {
    require(amount > 0, "Amount must be greater than zero");
    require(balanceOf(player) >= amount, "Insufficient balance for redemption");

    // Specific logic for redemption (update in-game store items, etc.).

    // Subtract redeemed tokens from player's balance
    _burn(player, amount);
}
```

### Checking Token Balance

Players can check their token balance at any time using the `checkBalance` function.

```solidity
function checkBalance(address account) external view returns (uint256) {
    return balanceOf(account);
}
```

### Burning Tokens

Anyone can burn their own tokens if they are no longer needed.

```solidity
function burn(uint256 amount) external {
    _burn(msg.sender, amount);
}
```

## Deployment

To deploy the DegenGamingToken contract, follow these steps:

1. Deploy the contract using your preferred development environment (Remix, Hardhat, etc.).
2. Ensure that the initial owner address is specified correctly during deployment.

## Interaction with the Contract

- Mint new tokens by calling the `mint` function.
- Transfer tokens using the `transferTokens` function.
- Redeem tokens for in-game items with the `redeem` function.
- Check token balances with the `checkBalance` function.
- Burn tokens using the `burn` function.

## License

This smart contract is released under the MIT License.

For more information or support, contact the Degen Gaming team.
```

Feel free to customize this template according to your specific project details and requirements. Provide additional information or instructions that you think users might need when interacting with your ERC-20 token.
# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
```
