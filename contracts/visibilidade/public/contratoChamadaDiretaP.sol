//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./contrato1.sol";

contract contratoChamadaDireta{
    contrato1 public c1;

    constructor(contrato1 paramC1){
        c1 = paramC1;
    }

    function chamarFuncao() public view returns(string memory){
        return c1.funcaoPublica();
    } 
}