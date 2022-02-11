// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; 
// this contract assigns deployer as the user and provides onlyOwner modifier 
contract Owned {
    address public owner;

    constructor() {
      owner = msg.sender;
   }

    modifier onlyOwner {
      require(
         msg.sender == owner,
         "Only owner can call this function"
      );
      _;
   }
}