// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./openzeppelin/token/ERC20/ERC20.sol";

contract MeuToken is ERC20 {
    constructor() ERC20("MeuToken", "MTK") {
        _mint(msg.sender,1000000 * 10 ** 18);
    }
}