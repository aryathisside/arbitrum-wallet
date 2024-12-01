// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DomainRegistry {
    mapping(string => address) public domains;

    function isDomainMinted(string memory domain) public view returns (bool) {
        return domains[domain] != address(0);
    }

    function mintDomain(string memory domain) public {
        require(domains[domain] == address(0), "Domain already minted");
        domains[domain] = msg.sender;
    }

    function getDomainOwner(string memory domain) public view returns(address){
        return domains[domain];
    }
}
