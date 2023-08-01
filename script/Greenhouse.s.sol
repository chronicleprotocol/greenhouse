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
    /// @dev Deploys a new Greenhouse instance with address `initialAuthed`
    ///      being auth'ed.
    function deploy(address initialAuthed) public {
        vm.startBroadcast();
        IGreenhouse greenhouse = new Greenhouse(initialAuthed);
        vm.stopBroadcast();

        console2.log("Deployed at", address(greenhouse));
    }

    // -- IAuth Functions --

    /// @dev Grants auth to address `who`.
    function rely(address self, address who) public {
        vm.startBroadcast();
        IAuth(self).rely(who);
        vm.stopBroadcast();

        console2.log("Relied", who);
    }

    /// @dev Renounces auth from address `who`.
    function deny(address self, address who) public {
        vm.startBroadcast();
        IAuth(self).deny(who);
        vm.stopBroadcast();

        console2.log("Denied", who);
    }

    // -- IToll Functions --

    /// @dev Grants toll to address `who`.
    function kiss(address self, address who) public {
        vm.startBroadcast();
        IToll(self).kiss(who);
        vm.stopBroadcast();

        console2.log("Kissed", who);
    }

    /// @dev Renounces toll from address `who`.
    function diss(address self, address who) public {
        vm.startBroadcast();
        IToll(self).diss(who);
        vm.stopBroadcast();

        console2.log("Dissed", who);
    }
}
