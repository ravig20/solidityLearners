// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
contract dyarrry{
    uint[] public arr ; // creating array of arr name
    uint[5] public arr2 = [1,2,3,4] ; //  creating array of arr2 name and also assigned its value
    uint[] Value ;
    function UpdateArray() public{
        Value[0] = 10;
        Value[1] = 20; 
        Value[2] = 30;
        Value[3] = 40;
        Value[4] = 50;
        Value[5] = 60;
        // but its take high gas
        }
    function ReturnArray() public view returns(uint){
        return Value[0];    
    
    }


}
    function setElement(uint item) public{
        arr.push(item); // push(by value)
    }
    function getlength() public view returns(uint){

        return arr.length;
    }
    // delete the last element of tha arr
     // [1,2,3,4,5] => pop() => [1,2,3,4]
    function popElement() public {
    arr.pop();
    }
     function getLength() public view returns(uint) {
        return arr2.length; // give length of the arr2 => 4;
    }

   
    


}