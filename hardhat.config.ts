import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.22",
        settings: {
          optimizer: {
            enabled: true,
            runs: 0,
          },
        }
      },
      {
        version: "0.8.20",
        settings: {
          optimizer: {
            enabled: true,
            runs: 0,
          },
        }
      },
       {
        version: "0.8.17",
        settings: {
          optimizer: {
            enabled: true,
            runs: 0,
          },
        }
      }
    ]
  }
};

export default config;
