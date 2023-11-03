// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "../openzeppelin/token/ERC20/ERC20.sol";

contract zkEVMTkn is ERC20 {
    constructor() ERC20("Hi ZK EVM", "HZK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
