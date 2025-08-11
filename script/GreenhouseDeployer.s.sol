// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script, console2 as console} from "forge-std@v1.9.6/Script.sol";

import {IGreenhouse} from "src/IGreenhouse.sol";

abstract contract GreenhouseDeployer is Script {
    function plant(address greenhouse, string memory name, bytes memory code)
        public
        returns (address)
    {
        bytes32 salt = keccak256(abi.encodePacked(name));

        vm.broadcast();
        address deployed = IGreenhouse(greenhouse).plant(salt, code);
        console.log(string.concat("Deployed ", name, " at"), deployed);

        return deployed;
    }

    function addressOf(address greenhouse, string memory name)
        public
        view
        returns (address)
    {
        bytes32 salt = keccak256(abi.encodePacked(name));

        return IGreenhouse(greenhouse).addressOf(salt);
    }
}
