// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping(address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address reciever, uint amount) public {
        require(minter == msg.sender);
        balances[reciever] += amount;
    }

    error insufficientBalance(uint requested, uint available);

    function send(address reciever, uint amount) public {
        if(amount > balances[msg.sender])
        revert insufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });

        balances[msg.sender] -= amount;
        balances[reciever] += amount;
        emit Sent(msg.sender, reciever, amount);
    }

}
