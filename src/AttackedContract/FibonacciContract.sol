// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {LibFibonacci} from "./LibFibonacci.sol";

contract FibonacciContract {
    error FibonacciContract__NotEnoughMoney();
    error FibonacciContract__NotAnOwner();

    address private s_libFibonacci;
    address private s_owner;

    uint256 private s_start;
    uint256 private s_countUser;
    uint256 private s_calculatedFibNumber;

    constructor(address libFibonacci) payable {
        s_libFibonacci = libFibonacci;
        s_owner = msg.sender;
    }

    modifier OnlyOwner() {
        if (msg.sender != s_owner) {
            revert FibonacciContract__NotAnOwner();
        }
        _;
    }

    function setStart(uint256 startNumber) external {
        (bool success, ) = s_libFibonacci.delegatecall(
            abi.encodeWithSelector(
                LibFibonacci(s_libFibonacci).setStartNumber.selector,
                startNumber
            )
        );
        require(success);
    }

    function withdraw() public {
        s_countUser++;

        (bool success, ) = s_libFibonacci.delegatecall(
            abi.encodeWithSelector(
                LibFibonacci(s_libFibonacci).setFibonacci.selector,
                s_countUser
            )
        );

        require(success);
        payable(msg.sender).transfer(
            (s_calculatedFibNumber * 1 ether) / 10 ** 4
        );
    }

    function withdrawAll() external OnlyOwner {
        if (address(this).balance == 0) {
            revert FibonacciContract__NotEnoughMoney();
        }

        payable(s_owner).transfer(address(this).balance);
    }

    receive() external payable {}

    function getOwner() external view returns (address) {
        return s_owner;
    }
}
