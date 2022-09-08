// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;
 contract Casino{
/*
*@ title random winner casino game 
*@ contract name casino
*/
    address internal owner; // initialise owner of this contract
    address payable[] public accounts; // it is a collection of all accounts Who play this game.
    uint private Nonce = 0; 
    uint private random_winner;
    
    struct Participant{
        string name;
		uint age;
		uint value;
    }
    
	mapping(address=>Participant) public participants; // that is a collection of details of a every address. Who Was joining this game.
    mapping(address=>bool) public participaded;
    event ownerMatadata(uint,bytes4, bytes, uint ); // it is a metadata. The peoples verified. The contract is deployed. Who is the owner of this contract? 
    event UserMatadata(uint,bytes4,bytes);
    //  Used to declared All the initial details of the contract
    constructor() payable{
            owner = msg.sender;
            emit ownerMatadata(block.timestamp, msg.sig, msg.data, msg.value );
    }
    // it is receiving Ethereum for the user but they don't received any input data.
    receive() external payable {

    }

    // gets received both data as well as a ethereum.
    fallback() external payable{

    }
    // check only owner.
    modifier onlyOwner(){
        require(msg.sender== owner," you are not the owner");
        _;
    }
    //check eligibility of the user who was eligible to participate in this smart contract.
    modifier check_Eligibility (uint _age){

		require(msg.sender != owner, "YOU ARE NOT Eligibile because you are owner of this contract");
        require(msg.sender != address(0), " invalid address");
		require(_age>=18,"18+ only");
		if(participaded[msg.sender]==true){
            revert("you are alredy participaded");
            }
        _;
    }
    // user only send only one ether on this contract, Defined by developer, as forclient demand.
	modifier deposit_amount(){
        require(1e18 == msg.value, "plese send correct ammount of ethers");
        _;
    }
    //  functions who allows For the user to join this contract.
    function join_contest(string memory _name, uint _age ) check_Eligibility(_age) deposit_amount public payable{
		participaded[msg.sender] = true;
		participants[msg.sender] = Participant(_name, _age, msg.value );
		accounts.push(payable(msg.sender));
        emit UserMatadata(block.timestamp, msg.sig, msg.data);
	
    }
    // for generating random number.
    function random_num() internal {
        Nonce++;
        random_winner = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, Nonce))) % accounts.length ;
    }
    // only owner for this function Gives up winner
    function genrate_winner() public onlyOwner payable{
        Casino.random_num();
        accounts[random_winner].transfer(address(this).balance);
        emit UserMatadata(block.timestamp, msg.sig, msg.data);
    }

   // check balance of the contract.
	function check_blance() public view returns(uint){
        return address(this).balance;
    }
    //check length. Of the Participant.
	function length_Participants() public view returns(uint){
		return accounts.length;
	}
 
 } 
