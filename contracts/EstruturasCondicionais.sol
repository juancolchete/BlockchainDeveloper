//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract EstruturasCondicionais{
    function validarIdade(uint idade) public pure returns(string memory){
        if(idade > 17){
            return "Maior de idade";
        }else{
            return "Menor de idade";
        }
    }
    //IMC
    //MENOR QUE 18,5	MAGREZA	0
    //ENTRE 18,5 E 24,9	NORMAL	0
    //ENTRE 25,0 E 29,9	SOBREPESO	I
    //ENTRE 30,0 E 39,9	OBESIDADE	II
    //MAIOR QUE 40,0	OBESIDADE GRAVE	III
    function retornaFaixaImc(uint imc) public pure returns(string memory){
        if(imc < 18){
            return "MAGREZA";
        }else if(imc < 25){
            return "NORMAL";
        }else if(imc < 30){
            return "SOBREPESO  I";
        }else if(imc < 40){
            return "OBESIDADE II";
        }else{
            return "OBESIDADE GRAVE II";
        }
    }
    // Em um determindo local com validação de entrada com blockchain
    // somente quem tiver o cartão com final entre 50 e 100 vai poder entra no local
    function validaCartao(uint finalCartao) public pure returns(string memory){
        require(finalCartao >= 50 && finalCartao <= 100,"Permissao insuficiente para entrada");
        return "Acesso liberado";
    }
}