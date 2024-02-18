import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";


const config: HardhatUserConfig = {
  etherscan: {
    apiKey: {
      snowtrace: "snowtrace", // apiKey is not required, just set a placeholder
    },
    customChains: [
      {
        network: "snowtrace",
        chainId: 43113,
        urls: {
          apiURL: "https://api.routescan.io/v2/network/testnet/evm/43113/etherscan",
          browserURL: "https://testnet.snowtrace.io"
        }
      }
    ]
  },
  solidity: "0.8.20",
  networks: {
    snowtrace: {
      url: 'https://api.avax-test.network/ext/bc/C/rpc',
      accounts: ['caa69acd2f394a8403420b71eb900880b680c580e6efc0c6f12f0274738c0a87']
    },
  },
};

export default config;