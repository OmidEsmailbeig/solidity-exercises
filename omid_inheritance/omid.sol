// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.7;

contract Omid {
    address owner;
    uint fortune;
    bool isDeceased;

    constructor() payable public{
        owner = msg.sender;
        fortune = msg.value;
        isDeceased = false;
    }

    // create modifier so the only person who can call the contract is the owner
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    // create modifier so that we only allocate funds if friend's gramps deceased
        modifier mustBeDeceased {
        require(isDeceased == true);
        _;
    }

    address payable [] familyWallets;

    // Map through inheritance 
    mapping(address => uint) inheritance;

    // Set inheritance for each address

    function setInheritance(address payable wallet, uint amount) public onlyOwner {
        // Add wallets to family wallets
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    function payout() private mustBeDeceased {
        for(uint i=0; i<familyWallets.length; i++) {
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }

    function hasDeceased() public onlyOwner {
        isDeceased = true;
        payout();
    }

}

