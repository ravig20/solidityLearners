// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract Test1{
    struct Person{
        uint age;
        string name;
    } 
    //created an object from the structure
    Person p1;
    
    constructor(){
        p1.age = 12;
        p1.name ="Sam";
    }
    
    function getPerson() public view returns(Person memory)
    {
        return p1;
    }
    
    function setPerson(uint _age,string memory _name) public {
        p1.age = _age;
        p1.name = _name;
    } 
    
}