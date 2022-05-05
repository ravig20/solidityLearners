// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
// @ way to remove array

contract ARRAY{
    uint[] public arr = [1,2,3];
    function deleteArr() public returns(uint _length) {
        delete arr[1]; // --> [1,0,3] but be wants [1,2] and also get 3 length
        return arr.length;
         }
    // this remove fuction do this work 
    // @shifting algrithumo 
    // @how the remove function work
    // --> [1,2,3,4,5,6] --> remove(3) --> [1,2,3,5,6,6] --> pop() --> [1,2,3,5,6]
    // this methord is gas consuming
    function remove(uint _index) public  {
        // arr --> [1,2,3]
        for(uint i = _index; i<arr.length-1; i++){
            require(_index<arr.length, "index out fof bound"); 
            arr[i] = arr[i+1]; // copy the array and update 

        }
        arr.pop();
    }
    /*
    @ replacing last its a good way 
    * but also have disadvantage tha array was not proper order
    * [1,2,3,4,5,6] --> replace(2) --> [1,2,6,4,5,6] --> pop() --> [1,2,6,4,5] :- not orderd
    */
    function replace(uint _index) public {
        arr[_index] = arr[arr.length - 1]; // copy last data and placed into a index
        arr.pop();
    }
    function lengthOF() public view returns(uint){
        return arr.length;
    }


}