// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import { Base64 } from "./libraries/Base64.sol";

contract ZendusNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  
  constructor() ERC721 ("CODE PSALM NFT", "CPN") {
    console.log("Nihil Obstat ...");
  }

  function mintNFT() public {
    uint256 newItemId = _tokenIds.current();
    string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Code And Aspirations", "description": "The midnight keyboard stroll of a Software developer.", "image": "ipfs.io/ipfs/Qmdiozx9cZVGHkh5T57V5g1DFkqDh46syZXqry7rPoAh9Q"}'
                    )
                )
            )
        );
    string memory NFTTokenUri = string(abi.encodePacked("data:application/json;base64,", json));
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, NFTTokenUri);
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
  }

}