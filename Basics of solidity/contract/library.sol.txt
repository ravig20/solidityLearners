// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

library Math{
    function sum(uint _a, uint _b) external pure returns(uint) {
        return _a + _b ;

    }
    function condisionFuction(uint x , uint y) external pure returns(uint){
        return x>=y ? x:y; // condisionFuction expraction like else if type if x is true (like x is greter then ya equal to y then x othervise y)
    }


}

contract UsingLibrary{
    // using add library we can add a+b
    function add(uint _a , uint _b) external  pure returns(uint ){
            return Math.sum(_a , _b) ;

    }
    function findGreterthen(uint x, uint y) pure external returns(uint){
        return Math.condisionFuction(x,y);
        
        }

}
library FindArr{
    function findArr(uint[] storage arr , uint _x  ) internal view returns(bool){
        for( uint i=0; i<arr.length-1; i++){
            if(arr[i] == _x){
                return true;
            }
            //revert ('num not found');

        }
    }

}
contract FindArrValue{
    // using FindArr for uint[];
    // uint[] public arr = [50,60,40,30,70,104,20];
    // function UsingLibrary2() external view returns(uint i){
    //    // return FindArr.findArr(arr,40); // also use this to find arr 
    //     return arr.findArr(40);
    // }
    uint[] public arr =  [50,60,40,30,70,104,20];
    function FindArr1(  uint _x) public view returns(bool){
        return FindArr.findArr(arr, _x);


    }


}