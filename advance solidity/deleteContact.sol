// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract Kill {
    event calleraddress(address caller);

    constructor() payable {}

    receive() external payable {}

    function kill() external payable {
        selfdestruct(payable(msg.sender));
        emit calleraddress(msg.sender);
    }

    function checkLived() external view returns (uint256, string memory) {
        return (address(this).balance, "i'm alived");
    }
}

contract Killer {
    receive() external payable {}

    function killer(Kill _kill) public returns (string memory) {
        _kill.kill();

        return "killed";
    }

    function checkLived() external view returns (uint256) {
        return (address(this).balance);
    }
}
