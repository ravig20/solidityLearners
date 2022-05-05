// Solidity program to demonstrate
// Bitwise Operator
pragma solidity ^0.5.0;

//homework 
//how the values are producted for bitwise operators

// Creating a contract
contract SolidityTest {

	// Declaring variables
	uint16 public a = 20;
	uint16 public b = 10;

	// Initializing a variable
	// to '&' value
	uint16 public and = a & b;

	// Initializing a variable
	// to '|' value
	uint16 public or = a | b;

	// Initializing a variable
	// to '^' value
	uint16 public xor = a ^ b;

	// Initializing a variable
	// to '<<' value
	uint16 public leftshift = a << b;

	// Initializing a variable
	// to '>>' value
	uint16 public rightshift = a >> b;

	// Initializing a variable
	// to '~' value
	uint16 public not = ~a ;
	
}
