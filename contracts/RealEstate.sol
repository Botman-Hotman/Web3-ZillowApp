//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


// boiler plate code the get an NFT of the ground

contract RealEstate is ERC721URIStorage {
	using Counters for Counters.Counter;
    Counters.Counter private _token_ids;


	constructor() ERC721("Real Estate", "REAL") {

	}


	function mint(string memory tokenURI) public returns (uint256) {
		_token_ids.increment();

		uint256 new_item_id = _token_ids.current();
		_mint(msg.sender, new_item_id);
		_setTokenURI(new_item_id, tokenURI);

		return new_item_id;
	}

	function totalSupply() public view returns (uint256) {
		return _token_ids.current();
	}
	
}
