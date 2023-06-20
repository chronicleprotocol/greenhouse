// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import {Greenhouse} from "src/Greenhouse.sol";

import {IGreenhouseTest} from "./IGreenhouseTest.sol";

contract GreenhouseTest is IGreenhouseTest {
    function setUp() public {
        setUp(address(new Greenhouse()));
    }
}
