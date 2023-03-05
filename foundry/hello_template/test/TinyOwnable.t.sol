// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/TinyOwnable.sol";

contract TinyOwnableTest is Test {
    TinyOwnable public tinyOwnable;

    address alice;
    address bob;

    function setUp() public {
        alice = makeAddr("alice");
        bob = makeAddr("bob");

        vm.startPrank(alice);
        tinyOwnable = new TinyOwnable();
        vm.stopPrank();
    }

    function testDeployment() external {
        address owner = tinyOwnable.owner();
        console.log(owner, alice, bob);

        assertEq(owner, alice);
    }

    function testSetNewOwner() externa {
        vm.startPrank(alice);
        tinyOwnable.setNewOwner(bob);
        address owner = tinyOwnable.owner();
        assertEq(owner, bob);
        vm.stopPrank();
    }

    function testFailSetNewOwner() external {
        vm.startPrank(bob);
        tinyOwnable.setNewOwner(address(777));
        vm.stopPrank();
    }

    function testShouldFailIfCallerIsNotAnOwner() external {
        vm.expectRevert("Only Owner Can Call");
        vm.startPrank(bob);
        tinyOwnable.setNewOwner(address(777));
    }

    fuction
}