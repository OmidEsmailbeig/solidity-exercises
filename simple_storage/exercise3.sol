// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Create a storage contract that sets and gets values - only the value it returns is multiplied 5x

contract simpleStorage {
    string names;

    function set(string memory name) public {
        names = name; 
    }

    function get() public view returns (string memory) {
        return names;
    }
}

