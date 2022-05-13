// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;
 
contract Owner{
    address public contract_Onwner  ;
    constructor() public {

        contract_Onwner = msg.sender; // in this case msg.sender is a person(address) how deploy this contrect
    }
    modifier onlyOwner() {
        require(msg.sender == contract_Onwner, "fuction not call");
        _;

    }
  
    
    function setOwner(address _New_onwner) external onlyOwner {
        require(_New_onwner != address(0), "invaild address");
        contract_Onwner = _New_onwner;

    }
    


}//this is a account how deploing this contrect 0xc96AB04f9C27847BA715074d9195ec84FB1f2543
// so msg.sender is this account 0xc96AB04f9C27847BA715074d9195ec84FB1f2543
// so only this 0xc96AB04f9C27847BA715074d9195ec84FB1f2543  can call setOwnert();