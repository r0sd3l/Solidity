// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; 

// its a way for dev to say that 
// any child of the abstract contract has to implement
// specified methods

abstract contract Logger {

    uint public testNum;

    constructor() {
        testNum = 1000;
    }

    function emitLog() public pure virtual returns(bytes32);

    function test3() private pure returns(uint) {
        return 100;
    }
}