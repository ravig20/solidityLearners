// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Bitarray {
    bytes public b1="abc";
    function pusselement() public{
        b1.push('d');


    }
    function getelement(uint i) public view returns(bytes1){
        return b1[i];
        
        }
    function getlength() public view returns(uint){

        return b1.length;
    }    

}