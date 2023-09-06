// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract LibFibonacci {
    uint256 private s_startNumber;
    uint256 private s_calculatedFibNumber;

    function setStartNumber(uint startNumber) public {
        s_startNumber = startNumber;
    }

    function setFibonacci(uint256 indexOfFibonacciNumber) public {
        s_calculatedFibNumber = fibonacci(indexOfFibonacciNumber);
    }

    function fibonacci(
        uint256 indexOfFibonacciNumber
    ) internal view returns (uint256) {
        if (indexOfFibonacciNumber == 0) {
            return s_startNumber;
        } else if (indexOfFibonacciNumber == 1) {
            return s_startNumber + 1;
        } else {
            return (indexOfFibonacciNumber - 1) + (indexOfFibonacciNumber - 2);
        }
    }

    function getCalculatedFibNimber() external view returns (uint256) {
        return s_calculatedFibNumber;
    }
}
