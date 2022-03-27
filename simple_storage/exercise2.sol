// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Create a storage contract that sets and gets values - only the value it returns is multiplied 5x

contract simpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x; 
    }

    function get() public view returns (uint) {
        return storedData * 5;
    }
}

