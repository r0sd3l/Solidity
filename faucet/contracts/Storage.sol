// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0; 

contract Storage {
    uint8 public a = 7;
    uint16 public b = 10;
    address public c = 0x5a139E63B10e867CF51deB4e7433838dC3158A0f;
    bool d = true;
    uint64 public e = 15;
    // 32 bytes, all values will be stored in slot 0
    // 0x 0f 01 5a139e63b10e867cf51deb4e7433838dc3158a0f 000a 07
    uint256 public f = 200; // 32 bytes -> slot 1
    uint8 public g = 40; // 1byte - slot 2
    uint256 public h = 789; // 32 bytes - slot 3

}