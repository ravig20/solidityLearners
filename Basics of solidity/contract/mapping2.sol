// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;
// THIS CONTRACT GET MAPPING ITEM AND MAPPING LENGTH
 contract mappingus{
    mapping(address=> uint) public transitions; 
    
    mapping(address=> bool) public item;
    address[] public keys;
    function transition(address _key , uint _value) external {
        transitions[_key] = _value;
        if(!item[_key]){
           item[_key] = true;
           keys.push(_key);
        }
        
    }
    function returnKeyLength() external view returns(uint) {
        return keys.length;
    }
}
/*
  @ random address  => uint value
1. 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 1000
2. 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 2000
3. 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db 3000
4. 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB 4000

*/