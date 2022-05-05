// SPDX-License-Identifier: GPL-3.0

 //use abi.encodeWithSignature
 // use call{}() // call assined 2 value bool , bytes data

pragma solidity  >=0.4.0 <0.9.0;

contract TextCall{
    receive() external payable{}
    string public name;
    uint public number;
     
     event Log(string message); // event 
     fallback() external payable{
      emit Log("fallback fuction call");
     }

    function setStateVar(string memory _name, uint _number) external payable returns(bool , uint){
        name = _name;
        number = _number;
        return(true, 999);
    }

}
contract CallOtherContract{
    bytes public data;
    // when calling other contrct fuction we need contrect address passing by perameter...
    function CallOtherContractFuction(address _address) external payable {
         (bool success, bytes memory _data) = 
        _address.call{value: 1222}(abi.encodeWithSignature("setStateVar(string, uint256)" , "call setStateVar", 123));
        //_address.call{value:1221}(abi.encodeWithSignature(TextCall.setStateVar()))
         require(success, "somthing falled");
         data =_data;
    }
}