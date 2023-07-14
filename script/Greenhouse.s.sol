// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";

import {IAuth} from "chronicle-std/auth/IAuth.sol";
import {IToll} from "chronicle-std/toll/IToll.sol";

import {IGreenhouse} from "src/IGreenhouse.sol";
import {Greenhouse} from "src/Greenhouse.sol";

/**
 * @title Greenhouse Management Script
 */
contract GreenhouseScript is Script {
    /// @dev Deploys a new Greenhouse instance.
    ///
    /// @dev Usage:
    ///
    ///      Set the following environment variables:
    ///      - RPC_URL           : The RPC URL
    ///      - PRIVATE_KEY       : The deployer's private key
    ///      - ETHERSCAN_API_KEY : An Etherscan API key
    ///
    ///      Deployment command:
    ///
    ///      ```bash
    ///      forge script \
    ///          --broadcast \
    ///          --rpc-url $RPC_URL \
    ///          --private-key $PRIVATE_KEY \
    ///          --etherscan-api-key $ETHERSCAN_API_KEY \
    ///          --verify
    ///          --sig "deploy()"
    ///          script/Greenhouse.s.sol:GreenhouseScript
    ///      ```
    function deploy() public {
        vm.startBroadcast();
        IGreenhouse greenhouse = new Greenhouse();
        vm.stopBroadcast();

        console2.log("Deployed at", address(greenhouse));
    }

    // -- IAuth Functions --

    /// @dev Grants auth to address `who`.
    ///
    /// @dev Usage:
    ///
    ///      Set the following environment variables:
    ///      - RPC_URL     : The RPC URL
    ///      - PRIVATE_KEY : The deployer's private key
    ///      - GREENHOUSE  : The Greenhouse instance's address
    ///      - WHO         : The address to grant auth to
    ///
    ///      Rely command:
    ///
    ///      ```bash
    ///      forge script \
    ///          --broadcast \
    ///          --rpc-url $RPC_URL \
    ///          --private-key $PRIVATE_KEY \
    ///          --sig $(cast calldata "rely(address,address)" $GREENHOUSE $WHO)
    ///          script/Greenhouse.s.sol:GreenhouseScript
    ///      ```
    function rely(address self, address who) public {
        vm.startBroadcast();
        IAuth(self).rely(who);
        vm.stopBroadcast();

        console2.log("Relied", who);
    }

    /// @dev Renounces auth from address `who`.
    ///
    /// @dev Usage:
    ///
    ///      Set the following environment variables:
    ///      - RPC_URL     : The RPC URL
    ///      - PRIVATE_KEY : The deployer's private key
    ///      - GREENHOUSE  : The Greenhouse instance's address
    ///      - WHO         : The address to renounce auth from
    ///
    ///      Deny command:
    ///
    ///      ```bash
    ///      forge script \
    ///          --broadcast \
    ///          --rpc-url $RPC_URL \
    ///          --private-key $PRIVATE_KEY \
    ///          --sig $(cast calldata "deny(address,address)" $GREENHOUSE $WHO)
    ///          script/Greenhouse.s.sol:GreenhouseScript
    ///      ```
    function deny(address self, address who) public {
        vm.startBroadcast();
        IAuth(self).deny(who);
        vm.stopBroadcast();

        console2.log("Denied", who);
    }

    // -- IToll Functions --

    /// @dev Grants toll to address `who`.
    ///
    /// @dev Usage:
    ///
    ///      Set the following environment variables:
    ///      - RPC_URL     : The RPC URL
    ///      - PRIVATE_KEY : The deployer's private key
    ///      - GREENHOUSE  : The Greenhouse instance's address
    ///      - WHO         : The address to grant toll to
    ///
    ///      Kiss command:
    ///
    ///      ```bash
    ///      forge script \
    ///          --broadcast \
    ///          --rpc-url $RPC_URL \
    ///          --private-key $PRIVATE_KEY \
    ///          --sig $(cast calldata "kiss(address,address)" $GREENHOUSE $WHO)
    ///          script/Greenhouse.s.sol:GreenhouseScript
    ///      ```
    function kiss(address self, address who) public {
        vm.startBroadcast();
        IToll(self).kiss(who);
        vm.stopBroadcast();

        console2.log("Kissed", who);
    }

    /// @dev Renounces toll from address `who`.
    ///
    /// @dev Usage:
    ///
    ///      Set the following environment variables:
    ///      - RPC_URL     : The RPC URL
    ///      - PRIVATE_KEY : The deployer's private key
    ///      - GREENHOUSE  : The Greenhouse instance's address
    ///      - WHO         : The address to renounce toll from
    ///
    ///      Diss command:
    ///
    ///      ```bash
    ///      forge script \
    ///          --broadcast \
    ///          --rpc-url $RPC_URL \
    ///          --private-key $PRIVATE_KEY \
    ///          --sig $(cast calldata "diss(address,address)" $GREENHOUSE $WHO)
    ///          script/Greenhouse.s.sol:GreenhouseScript
    ///      ```
    function diss(address self, address who) public {
        vm.startBroadcast();
        IToll(self).diss(who);
        vm.stopBroadcast();

        console2.log("Dissed", who);
    }
}
