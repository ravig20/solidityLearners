// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract PropertyTransfer{
    address public  land_resistry_department;// owner of this contract
    struct Property{
        string owner_name; // property owner name 
        string land_location; // location of the land
        uint land_resistry_number; // land unique ID number provided by contract owner
        address currentOwner; // bytes32 uinque address & also called current owner of this property
        
        
    }
    address[] public allAddress; /* collect all addresses of the property for geting
    length how many address are listed in this contract */
    mapping(address=>Property) public properts; // map all key (address) to value (like struct)
    mapping(address=>bool) public PushAddress;  // this mapping can help to update allAddress
   // assign contract owner
    constructor()  {
        land_resistry_department = msg.sender;
    }
    // modifier
    modifier onlyOwner(){
        require(land_resistry_department == msg.sender);
        _;
    }
    // updateProperty fuction update details of the properts
    function updateProperty(address _newaddress,
         string memory _owner_name , string memory _land_location, uint _land_resistry_number ) public onlyOwner 
    {   
        properts[_newaddress] = Property(_owner_name , _land_location, _land_resistry_number, _newaddress);// updating struct
        require(_newaddress != address(0), " invalid address");
        
        if(!PushAddress[_newaddress]){
            PushAddress[_newaddress] = true;
            allAddress.push(_newaddress);
        }

    }
    // for get how many numbers of property are listed
    function totalNoOf_Property() public onlyOwner view returns(uint){
        // this fuction show total no of properts 
        return allAddress.length;
    }
    // transfer the ownership of the property 
    function transfer(address _newOwner, address _OldPropertyOwnerAddress , string memory _newOwnername ) public  {
        require(properts[_OldPropertyOwnerAddress].currentOwner == msg.sender, "you are not a owner of this contract");
        require(_newOwner != address(0), "invalid address");
        
        properts[_OldPropertyOwnerAddress].owner_name = _newOwnername; // not empty
        properts[_OldPropertyOwnerAddress].currentOwner = _newOwner;
        }

    
    
}