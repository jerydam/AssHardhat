# Project Overview

## Description
Degen Gaming, a prominent game studio, aims to enhance player engagement and loyalty by introducing a unique token system within their gaming ecosystem. This token, known as the Degen Token, will serve as a means for players to earn rewards in-game and exchange them for items available in the in-game store. The token will be deployed on the Avalanche blockchain, chosen for its speed and low transaction fees.

## Challenge
The challenge involves creating an ERC-20 token smart contract and deploying it on the Avalanche network to fulfill the requirements set by Degen Gaming.

# Features of the Degen Token (ERC-20) Smart Contract

## 1. Minting New Tokens
- The platform allows for the creation of new tokens, which can be distributed to players as rewards.
- Minting of tokens is restricted to the owner of the smart contract.

## 2. Transferring Tokens
- Players have the ability to transfer their tokens to other addresses within the network.

## 3. Redeeming Tokens
- Tokens can be redeemed by players to acquire items available in the in-game store.
- Redemption transactions are facilitated by the contract, ensuring secure exchanges.

## 4. Checking Token Balance
- Players can query the contract to check their token balance at any given time.

## 5. Burning Tokens
- Token holders have the option to burn tokens that they no longer require.
- Burning tokens helps maintain token supply dynamics and can serve various purposes, including reducing token circulation.

## 6. Setting the In-Game Store Address
- The contract allows the owner to specify the address of the in-game store where players can redeem their tokens.
- This functionality ensures seamless integration between the token system and the in-game store.

# Smart Contract Explanation

The Degen Token smart contract is implemented using Solidity, a programming language for Ethereum smart contracts. It inherits from the ERC-20 standard, providing all the functionalities expected from an ERC-20 token.

The contract includes the following components:

- **State Variables:** The contract maintains a mapping of token balances for each address and stores the address of the in-game store.
- **Events:** An event is emitted when tokens are burned, allowing observers to track token burning activities.
- **Modifiers:** The contract includes modifiers to enforce access control, ensuring that only authorized entities can perform certain operations.
- **Constructor:** Initializes the contract with the token name and symbol.
- **Public Functions:** The contract provides functions for minting new tokens, transferring tokens, redeeming tokens at the in-game store, checking token balances, burning tokens, and setting the in-game store address.
- **Internal Functions:** Internal functions handle token transfers and execute necessary checks to ensure the integrity of the token system.

# Conclusion

The Degen Token (ERC-20) project presents an opportunity to contribute to the evolution of gaming ecosystems by introducing a token-based reward system. By deploying the Degen Token on the Avalanche blockchain, players can engage more deeply with the gaming experience, fostering a stronger sense of community and participation within the gaming community.
