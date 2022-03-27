// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Create a smart contract that can store data and return the data back

// 1. Receive information, 2. Store information, 3. Return the information

contract simpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x; 
    }

    function get() public view returns (uint) {
        return storedData;
    }
}

