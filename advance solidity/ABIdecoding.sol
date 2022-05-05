 // SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;
/*
        @ this contract encode and decode used data 
           =>form bytes to data & data to bytes 
*/

contract ABIdecode{
    struct info{
        string name ;
        uint[2] arr;
    }
    /*
    * @ encode some data into bytes 
        @ encoding syntex
      => abi.encode(data1 , data2, data3.....) using this syntex
      => abiencodePacked(data1 , data2, data3.....) both do same task
    */
    function encode( 
        uint x,
        address _address,
        uint[] calldata arr,
        info calldata _info
        ) external pure returns(bytes memory  ){
            return abi.encode(x,_address,arr,_info);
        }
      /*
     @ decode some bytes data into its data types
     @ decoding syntex
      => abi.decode(bytes data, (its data types like => uint, string, struct,.....)) using this syntex
      => (assing data like => num, name,...., ) = abi.decode(bytes data, (its data types like => uint, string, struct,.....))
    */
    function decode( 
        bytes calldata _data
        ) external pure returns( uint x,
        address _address,
        uint[] memory arr,
        info memory _info){
            (x ,_address, arr, _info) = abi.decode(_data, (uint, address, uint[], info));
        }
    

}