// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {stdJson} from "forge-std/StdJson.sol";
import {StdStyle} from "forge-std/StdStyle.sol";

import {Chaincheck} from "@script/chronicle-std/Chaincheck.sol";
import {IAuthChaincheck} from "@script/chronicle-std/IAuthChaincheck.sol";
import {ITollChaincheck} from "@script/chronicle-std/ITollChaincheck.sol";

import {IGreenhouse} from "src/IGreenhouse.sol";

/**
 * @notice IGreenhouse's `chaincheck` Integration Test
 *
 * @dev Config Definition:
 *
 *      ```json
 *      {
 *          "IGreenhouse": {},
 *          "IAuth": {
 *              "legacy": bool,
 *              "authed": [
 *                  "<Ethereum address>",
 *                  ...
 *              ]
 *          },
 *          "IToll": {
 *              "legacy": bool,
 *              "tolled": [
 *                  "<Ethereum address>",
 *                  ...
 *              ]
 *          }
 *      }
 *      ```
 */
contract IGreenhouseChaincheck is Chaincheck {
    using stdJson for string;

    IGreenhouse self;
    string config;

    string[] _logs;

    function setUp(address self_, string memory config_)
        external
        override(Chaincheck)
        returns (Chaincheck)
    {
        self = IGreenhouse(self_);
        config = config_;

        return Chaincheck(address(this));
    }

    function run()
        external
        override(Chaincheck)
        returns (bool, string[] memory)
    {
        check_IAuth();
        check_IToll();

        // Fail run if non-zero number of logs.
        return (_logs.length == 0, _logs);
    }

    /// @dev Checks the IAuth module dependency.
    function check_IAuth() internal {
        // Run IAuth chaincheck.
        string[] memory authLogs;
        (, authLogs) = new IAuthChaincheck()
                            .setUp(address(self), config)
                            .run();

        // Add logs to own logs.
        for (uint i; i < authLogs.length; i++) {
            _logs.push(authLogs[i]);
        }
    }

    /// @dev Checks the IToll module dependency.
    function check_IToll() internal {
        // Run IToll chaincheck.
        string[] memory authLogs;
        (, authLogs) = new ITollChaincheck()
                            .setUp(address(self), config)
                            .run();

        // Add logs to own logs.
        for (uint i; i < authLogs.length; i++) {
            _logs.push(authLogs[i]);
        }
    }
}
