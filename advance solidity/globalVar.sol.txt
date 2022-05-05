// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.0 <0.9.0;

contract Globally_Var{

    function get() public  payable returns(bytes memory msg_data, address msg_sender, bytes4 msg_sig, uint msg_value, 
    uint time_stamp, uint tx_gassPrise, address tx_origin){
        return(msg.data, msg.sender, msg.sig, msg.value, block.timestamp, tx.gasprice, tx.origin );



    }
    /*{
	"0": "bytes: msg_data 0x6d4ce63c",
	"1": "address: msg_sender 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
	"2": "bytes4: msg_sig 0x6d4ce63c",
	"3": "uint256: msg_value 0",
	"4": "uint256: time_stamp 1641476297",
	"5": "uint256: tx_gassPrise 1",
	"6": "address: tx_origin 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"
    */