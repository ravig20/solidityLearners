// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
/*
*@ topic call state var of other contract
*@ new key word 
*/

contract C {
    uint public data = 42;
    function me() external pure returns(uint){ uint a =10; return a;}
}

contract Caller {
   C c = new C();  // using this we allow to call state variable of other contract
   function callStateVar() public view returns(uint){
     uint a =  c.data(); //gas 293848
     return a;//295090
   }
}