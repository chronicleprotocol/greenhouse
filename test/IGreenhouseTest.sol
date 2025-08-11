// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std@v1.9.6/Test.sol";

import {IToll} from "chronicle-std@v2/toll/IToll.sol";

import {IGreenhouse} from "src/IGreenhouse.sol";

abstract contract IGreenhouseTest is Test {
    IGreenhouse greenhouse;

    // Copied from IGreenhouse.
    event Planted(
        address indexed caller, bytes32 indexed salt, address indexed addr
    );

    function setUp(address greenhouse_) internal {
        greenhouse = IGreenhouse(greenhouse_);

        // Toll address(this) to be eligible to plant contracts.
        IToll(address(greenhouse)).kiss(address(this));
    }

    function testFuzz_plant_ContractWithArguments(bytes32 salt) public {
        vm.assume(salt != bytes32(0));

        // Make creation code.
        bytes memory creationCode = abi.encodePacked(
            type(ContractWithArguments).creationCode,
            abi.encode(address(0xcafe), uint(0))
        );

        vm.expectEmit();
        emit Planted(address(this), salt, greenhouse.addressOf(salt));

        // Deploy contract via greenhouse.
        address addr = greenhouse.plant(salt, creationCode);
        assertTrue(addr.code.length != 0);

        // Contract is callable.
        assertEq(ContractWithArguments(addr).addr(), address(0xcafe));

        // Contract's address equals `addressOf(salt)(address)`'s return value.
        assertEq(addr, greenhouse.addressOf(salt));
    }

    function testFuzz_plant_ContractWithoutArguments(bytes32 salt) public {
        vm.assume(salt != bytes32(0));

        // Make creation code.
        bytes memory creationCode = type(ContractWithoutArguments).creationCode;

        vm.expectEmit();
        emit Planted(address(this), salt, greenhouse.addressOf(salt));

        // Deploy contract via greenhouse.
        address addr = greenhouse.plant(salt, creationCode);
        assertTrue(addr.code.length != 0);

        // Contract is callable.
        assertEq(ContractWithoutArguments(addr).counter(), 0);

        // Contract's address equals `addressOf(salt)(address)`'s return value.
        assertEq(addr, greenhouse.addressOf(salt));
    }

    function test_plant_FailsIf_SaltIsEmpty() public {
        bytes memory creationCode = type(ContractWithoutArguments).creationCode;

        vm.expectRevert(IGreenhouse.EmptySalt.selector);
        greenhouse.plant(bytes32(""), creationCode);
    }

    function test_plant_FailsIf_CreationCodeIsEmpty() public {
        bytes memory empty;

        vm.expectRevert(IGreenhouse.EmptyCreationCode.selector);
        greenhouse.plant(bytes32("salt"), empty);
    }

    function testFuzz_plant_FailsIf_SaltAlreadyPlanted(bytes32 salt) public {
        vm.assume(salt != bytes32(0));

        bytes memory creationCode = type(ContractWithoutArguments).creationCode;

        greenhouse.plant(salt, creationCode);

        vm.expectRevert(
            abi.encodeWithSelector(IGreenhouse.AlreadyPlanted.selector, salt)
        );
        greenhouse.plant(salt, creationCode);
    }

    function test_plant_IsTollProtected() public {
        vm.prank(address(0xbeef));
        vm.expectRevert(
            abi.encodeWithSelector(IToll.NotTolled.selector, address(0xbeef))
        );
        greenhouse.plant(0, type(ContractWithArguments).creationCode);
    }
}

contract ContractWithArguments {
    address public addr;
    uint public counter;

    constructor(address addr_, uint counter_) {
        addr = addr_;
        counter = counter_;
    }
}

contract ContractWithoutArguments {
    uint public counter;
}
