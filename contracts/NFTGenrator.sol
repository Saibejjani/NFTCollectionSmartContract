//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;
import "./MyNFTCollection.sol";

contract NFTGenrator {
    MyNFTCollection[] public collections;
    mapping(address => MyNFTCollection[]) public accounts;

    function createNewCollection(
        string memory Name,
        string memory Symbol,
        string memory baseUri,
        uint256 mintAmount
    ) public {
        MyNFTCollection collection = new MyNFTCollection(
            Name,
            Symbol,
            baseUri,
            mintAmount,
            msg.sender
        );
        collection.transferOwnership(msg.sender);
        accounts[msg.sender].push(collection);
        collections.push(collection);
    }

    function deployedCount(address account) public view returns (uint256) {
        return accounts[account].length;
    }

    function collectionsLength() public view returns (uint256) {
        return collections.length;
    }

    function tokenURI(uint256 collectionIndex_, uint256 URIIndex)
        public
        view
        returns (string memory)
    {
        return collections[collectionIndex_].tokenURI(URIIndex);
    }
}

//0xd9145CCE52D386f254917e481eB44e9943F39138
