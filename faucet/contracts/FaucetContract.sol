// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; 

contract Faucet {
   // create array of addresses to store donators
   address[] private donators;

   // allows the contract to receive ether
   receive() external payable {}

   // this function allows funds to be sent to the smart contract
   function addFunds() external payable {
      // add the address of donator to array
      donators.push(msg.sender);
   }

   // this function returns the current list/array of donators
   function getAllDonators() public view returns (address[] memory) {
      return donators;
   }

   function getDonatorAtIndex(uint8 index) external view returns (address) {
         address[] memory _donators = getAllDonators();
         return _donators[index];
   }  
}

