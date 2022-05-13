// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;
contract Enum_Workspace {
    // its a user define array
    enum  GalssSIZE  {small, large, medium}
    GalssSIZE choicesize ;
    GalssSIZE constant Defult_sizeOFglass = GalssSIZE.medium;
    function setGlassSize() public  {
        choicesize = GalssSIZE.medium;
    }
    function getGlassSIZE() public view returns(GalssSIZE){
        return choicesize;
    
    }
    function getDefultChoice() public pure returns(GalssSIZE) {

        return GalssSIZE.large  ;
    }

enum rough{book, notes, paper}
rough name;




}