 // SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract Kill{
    event calleraddress(address caller);
    constructor()  payable{}
    receive() external payable{}
    function kill() payable external {
        selfdestruct(payable(msg.sender));
        emit calleraddress(msg.sender);

    }
    function checkLived() view external returns(uint, string memory){
        return (address(this).balance, "i'm alived");

    }

}

contract Killer{
    receive() external payable{}
    function killer(Kill _kill ) public returns(string memory){
        _kill.kill();

        return "killed";
        
    }
    
    function checkLived() view external returns(uint){
        return (address(this).balance);

    }
}