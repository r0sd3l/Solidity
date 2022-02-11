// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; 

import "./Owned.sol";

contract Faucet is Owned {
   uint public numOfDonators;
   // create mapping to store addresses of donators
   // key => value
   mapping(address => bool) private donators;
   mapping(uint => address) private lutDonators;

   // this modifier limits amount that is able to be withdrawn every tx (.1 eth)
   modifier limitWithdraw(uint withdrawAmount) {
      require(
         withdrawAmount <= 100000000000000000,
         "Cannot withdraw more than .1 ether"
      );
      _;
   }

   // allows the contract to receive ether
   receive() external payable {}

   // this function allows funds to be sent to the smart contract
   function addFunds() external payable {
      // create mapping of donator's address
      address donator = msg.sender;
      if (!donators[donator]) {
         uint index = numOfDonators++;
         donators[donator] = true; 
         lutDonators[index] = donator;
      }
   }

   // this function withdraws from the smart contract with a limit of .1 eth per transaction
   function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount) {
         payable(msg.sender).transfer(withdrawAmount);
   }

   // this function returns an array of all donator's addresses
   function getAllDonators() external view returns (address [] memory) {
      // create new array to store addresses
      address[] memory _donators = new address[](numOfDonators);
      // loop through our keys and values, store addresses (values) in array
      for (uint i =0; i < numOfDonators; i++) {
         _donators[i] = lutDonators[i];
      }
      return _donators;
   }   

   // returns the donator's address at a specified index
   function getDonatorAtIndex(uint8 index) external view returns (address) {
         return lutDonators[index];
   }  
}

