//SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract Conta{
    uint256 public saldo;

    function saque(uint256 valorSaque) internal returns(uint256) {
        require(saldo >= valorSaque,"Conta: Valor de saque maior que saldo");
        saldo -= valorSaque;
        return valorSaque;
    }

    function deposito(uint256 valorDeposito) internal{
        saldo += valorDeposito;
    }

    function iAmPublic() public{
        saldo = saldo;
    }

    function iAmInternal() internal{
        saldo = saldo;
    }

    function iAmExternal() external{
        saldo = saldo;
    }

    function iAmPrivate() private{
        saldo = saldo;
    }
}