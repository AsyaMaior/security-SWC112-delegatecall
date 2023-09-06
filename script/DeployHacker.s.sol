//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Hacker} from "../src/HackerContract/Hacker.sol";
// import {FibonacciContract} from "../src/AttackedContract/FibonacciContract.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract DeployHacker is Script {
    function run() external returns (Hacker) {
        address mostRecentlyDeployedFibonacciContract = DevOpsTools
            .get_most_recent_deployment("FibonacciContract", block.chainid);
        vm.startBroadcast();
        Hacker hacker = new Hacker(mostRecentlyDeployedFibonacciContract);
        vm.stopBroadcast();
        return hacker;
    }
}
