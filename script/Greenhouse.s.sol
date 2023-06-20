// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {Script} from "forge-std/Script.sol";

import {IGreenhouse} from "src/IGreenhouse.sol";
import {Greenhouse} from "src/Greenhouse.sol";

/**
 * @title Greenhouse Management Script
 *
 * @dev Usage:
 *
 *      ```bash
 *      forge script \
 *          --broadcast \
 *          --rpc-url <RPC_URL> \
 *          --private-key <PRIVATE_KEY> \
 *          --etherscan-api-key <ETHERSCAN_API_KEY> \
 *          --verify
 *          --sig "deploy()"
 *          script/Greenhouse.s.sol:GreenhouseScript
 *      ```
 */
contract GreenhouseScript is Script {
    /// @dev You'll want to adjust this address if the greenhouse is already
    ///      deployed.
    IGreenhouse internal greenhouse = IGreenhouse(address(0));

    function deploy() public returns (IGreenhouse) {
        vm.startBroadcast();
        greenhouse = new Greenhouse();
        vm.stopBroadcast();

        return greenhouse;
    }
}
