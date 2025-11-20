# HaikuNFT Demo Contract

This repository contains a minimal but clean example of an ERC-721 based Haiku NFT smart contract.  
It demonstrates the following concepts:

- Struct data storage  
- Arrays and mappings  
- NFT minting  
- Custom errors  
- Basic data validation  

This project is used as a learning exercise for the Base developer on-chain course.

## Contract Features

- `mintHaiku()` — mints a unique Haiku NFT and stores the poem lines on-chain.  
- `shareHaiku()` — allows the owner to share a Haiku with another address.  
- `getMySharedHaikus()` — returns all haikus shared with the caller.  
- Full on-chain storage via a struct and dynamic array.  

## Tools Used
- Solidity ^0.8.18  
- Remix  
- Base Sepolia Testnet  

## License
MIT
