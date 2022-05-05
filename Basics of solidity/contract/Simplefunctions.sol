// SPDX-License-Identifier: MIT
pragma solidity ^0.9.0;

contract firstContract{
    uint i; //state variable
    
    constructor(uint _i) public{
        i = _i; //assigning value to a state variable using constructor
    }
    
    function setData(uint _i) public{
        i = _i; //assigning value to a state variable using function
    }
    
    function getData() public view returns(uint){
        return i; //returning the value of a state variable
    }
    
    function getTime() public view returns(uint256){
        return block.timestamp; //this returns Unix Time timestamp
        //to convert to human readable data use https://www.epochconverter.com/
        
    }
}
