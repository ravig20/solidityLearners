// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.0 <0.9.0;
contract MappingExample{
   //define struct as book name
    struct Books{
        string book_name;
        uint book_id;
        uint coloum_no;

    }
     // simple mapping
    mapping(uint=>string) public enroll_no; //decalear mapping
    function updateMapping(uint _enroll_no, string memory _name) public {
        enroll_no[_enroll_no] = _name;
    }
    // for using struct varibal

    mapping(uint=>Books) public books;
    //_id represent book no
    function updateBook_manual(uint _id, string memory _book_name, uint _book_id , uint _coloum_no ) public {
        books[_id] = Books(_book_name,_book_id, _coloum_no);
    }



}