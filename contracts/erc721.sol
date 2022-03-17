// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract ZendusNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  string private nftMeta = string(abi.encodePacked('{"name":"Code And Aspirations", "image":"ipfs.io/ipfs/Qmdiozx9cZVGHkh5T57V5g1DFkqDh46syZXqry7rPoAh9Q", "description":"The midnight keyboard stroll of a developer"}'));
  
  constructor() ERC721 ("ZendusPoemNFT", "ZPN") {
    console.log("Nihil Obstat ...");
  }

  function mintNFT() public {
    uint256 newItemId = _tokenIds.current();
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, nftMeta);
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
  }

}