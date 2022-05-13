// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.4.0 <0.9.0;
contract structExample {
    // define struct 
    struct Stydent{ string name ; uint roll_no ; uint class ;} // for class name of studend record
    struct Book{ string Book_name ; uint Book_ID; }// for use for library record
    Stydent[] students;
    Book[] books;
    function setStudent(string memory _name , uint _roll_no , uint _class ) public {

            students.push(Stydent(_name, _roll_no, _class));



    }
    function setBooks( string  memory _Book_name , uint _Book_ID) public {
        books.push( Book(_Book_name, _Book_ID));


    }
   


    
}