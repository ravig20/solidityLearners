// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.3;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    //datatype view variable_name = variable_value
    uint public num = 123;
    uint public ctimestamp;
    address public callinguser;
     function store(uint256 _num) public {
        num = _num;
    }

    function doSomething() public {
        // Local variables are not saved to the blockchain.
        uint i = 456;

        // Here are some global variables
        uint timestamp = block.timestamp; // Current block timestamp
        ctimestamp = timestamp;
        address sender = msg.sender; // address of the caller
        callinguser = sender;
    }
}