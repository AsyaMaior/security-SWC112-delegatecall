//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

interface IFibonacciContract {
    function setStart(uint startNumber) external;

    function withdrawAll() external;
}
