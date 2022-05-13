// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

/*
 *@ topic - how to call another contract fuction
 * using this the fuction was not exexting in other contrect the current contrect not deployde
 * reduse errors also ...
 *@ .call is not better
 *  because when we used .call fuction for not exexting fuctiom tha fall back fuction was called
 */
// this caller contract call fuction of callee contract
contract Callee {
    uint256 public x;
    uint256 public ethers;

    function setX(uint256 _x) public returns (uint256) {
        x = _x;
        return x;
    }

    function takeSomeEther(uint256 _x)
        public
        payable
        returns (uint256, uint256)
    {
        x = 2 * _x;
        ethers = msg.value;
        return (x, ethers);
    }
}

contract caller {
    uint256 public x;
    uint256 public ethers;

    // calling other contract not pay able function
    function setX(Callee callee, uint256 _x) public returns (uint256) {
        x = callee.setX(_x);
        return x;
    }

    // calling other contract not pay able function
    function takeSomeEther(Callee callee, uint256 _x)
        public
        payable
        returns (uint256, uint256)
    {
        (uint256 y, uint256 value) = callee.takeSomeEther{value: msg.value}(_x);
        return (y, value);
    }
}
