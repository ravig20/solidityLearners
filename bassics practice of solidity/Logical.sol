// Solidity program to demonstrate
// Logical Operators
pragma solidity ^0.5.0;

//homrework - to identify the variables values
// Creating a contract
contract logicalOperator{

	// Defining function to demonstrate
	// Logical operator
	function Logic(
	bool a, bool b) public view returns(
	bool, bool, bool){
		
	// Logical AND operator
	bool and = a&&b;
		
	// Logical OR operator
	bool or = a||b;
		
	// Logical NOT operator
	bool not = !a;
	return (and, or, not);
}
}
