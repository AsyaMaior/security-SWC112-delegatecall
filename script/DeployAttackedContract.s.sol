//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {LibFibonacci} from "../src/AttackedContract/LibFibonacci.sol";
import {FibonacciContract} from "../src/AttackedContract/FibonacciContract.sol";

contract DeployAttackedContract is Script {
    function run() external returns (FibonacciContract) {
        vm.startBroadcast();
        LibFibonacci libFibonacci = new LibFibonacci();
        FibonacciContract fibonacciContract = new FibonacciContract{
            value: 20 ether
        }(address(libFibonacci));
        vm.stopBroadcast();
        return fibonacciContract;
    }
}
