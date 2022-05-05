// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract IfElse {
    function func(uint _y) public pure returns (uint) {
        if (_y < 10) {
            return 0;
        } else if (_y < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        return _x < 10 ? 1 : 2;
    }
}
