// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import "./openzeppelin0.8.20/contracts/token/ERC721/ERC721.sol";
import "./openzeppelin0.8.20/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./openzeppelin0.8.20/contracts/access/AccessControl.sol";
import "./openzeppelin0.8.20/contracts/utils/Strings.sol";
import "./openzeppelin0.8.20/contracts/utils/ReentrancyGuard.sol";

contract FurnitureDegen is ERC721, ERC721URIStorage, AccessControl, ReentrancyGuard {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint256 private _nextTokenId;
    uint256 public price;
    uint256 public mintLimit;
    string public baseURI;
    address payable public receiver;
    
    using Strings for uint256;
    
    event changePriceMintLimit(uint256 newPrice, uint256 oldPrice,uint256 newMintLimit, uint256 oldMintLimit);
    
    error aboveMintLimit(uint256 mintLimit);
    error insuficientBalance(uint256 balance,uint256 neededBalance);
    error quantityShoulBeAboveZero();

    constructor(address defaultAdmin, address minter, uint256 newPrice, uint256 newMintLimit,address payable ethReceiver) ERC721("Furniture Degen", "FDG") {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
        price = newPrice;
        mintLimit = newMintLimit;
        baseURI = "ipfs://bafybeiddmrnbqfyruufu2cwitswbtcaaf4ahvn5anq7xvypa65tb7kjibe/";
        receiver = ethReceiver;
        emit changePriceMintLimit(newPrice,price,newMintLimit,mintLimit);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI; 
    }

    function safeMint(address to) public onlyRole(MINTER_ROLE) {
      _safeMint(to);
    }
  
    function buy(uint256 quantity,address to) public payable nonReentrant(){
      if(_nextTokenId + quantity > mintLimit){
        revert aboveMintLimit(mintLimit);
      }
      if(getTokenPrice(quantity) > msg.value){
        revert insuficientBalance(msg.sender.balance,getTokenPrice(quantity)); 
      }
      if(quantity <= 0){
        revert quantityShoulBeAboveZero();
      }
      for(uint256 i = 0;i < quantity;i++){
        _safeMint(to);
      }
      receiver.transfer(address(this).balance);
    }

    function getTokenPrice(uint256 quantity) public view returns(uint256){
      return price*quantity;
    }

    function updatePriceMintLimit(uint256 newPrice, uint256 newMintLimit) public onlyRole(DEFAULT_ADMIN_ROLE){
      price = newPrice;
      mintLimit = newMintLimit;
      emit changePriceMintLimit(newPrice,price,newMintLimit,mintLimit);
    }

    function updateBaseURI(string calldata newBaseURI) public onlyRole(DEFAULT_ADMIN_ROLE){
      baseURI = newBaseURI;
    }


    function _safeMint(address to) private{
      uint256 tokenId = _nextTokenId++;
      _safeMint(to, tokenId);
      _setTokenURI(tokenId, tokenId.toString());
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
