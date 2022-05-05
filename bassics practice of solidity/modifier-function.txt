pragma solidity ^0.8.0;
contract FunctionModifiers {
address public creator;
function FunctionModifiers(){
    creator= msg.sender ;
    }

Modifier onlyCreator(){
if(msg.sender != creator){
throw;
}
_;
// resumes the function execution wherever the access modifier is used
}
function killContract () onlyCreator { //this function will not execute if an exception occurs
self-destruct (creator);
}
}