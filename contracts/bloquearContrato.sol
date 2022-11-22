// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

/**
 * @dev Contrato cujo objetivo é ter bloqueio de uma ou mais funções por tempo,
 * o bloqueio é passado pelo construtor em segundos
 */
contract bloquearContrato{
    uint256 public tempoBloqueado;
    constructor(uint256 tsBloqueio){
        tempoBloqueado = block.timestamp+tsBloqueio;
    }
    function bloqueadoPorTempo() public view returns(string memory){
        require(block.timestamp > tempoBloqueado,"BC: funcao bloqueada");
        return "Nao esta bloqueado";
    }
    function obterTs() public view returns(uint256){
        return block.timestamp;
    }
}