//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./Conta.sol";

contract ContaPoupanca is Conta{
    uint256 taxaJuros = 1;
    uint256 ultimoSaque = block.timestamp;
    uint256 public jurosRecebido;
    uint256 public totalSacado;
    function sacarPoupanca(uint256 valorSaque) public {
        jurosRecebido += (block.timestamp - ultimoSaque)*taxaJuros;
        totalSacado += super.saque(valorSaque);
        ultimoSaque = block.timestamp;
    }
}