
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract A {
    function functionName() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.functionName()
    function functionName() public pure virtual override returns (string memory) {
        return "B";
    }
}