//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract StateMutability{
    uint primeiroValor = 30;
    uint segundoValor = 20;
    uint private _soma = 0;
 
    function somaView() public view returns(uint soma){
        return primeiroValor + segundoValor;
    }

    function somaPure(uint num1, uint num2) public pure returns(uint soma){
        return num1 + num2;
    }

    function somaAtribuiNonPayable(uint num1, uint num2) public{
        primeiroValor = num1;
        segundoValor = num2;
        _soma = primeiroValor + segundoValor;
    }

    function somaAtribuiPayable(uint num1, uint num2) public payable{
        if(msg.value == 100){
            primeiroValor = num1;
            segundoValor = num2;
            _soma = primeiroValor + segundoValor;
        }
    }
    
    function verSoma() public view returns(uint soma){
        return _soma;
    }
}