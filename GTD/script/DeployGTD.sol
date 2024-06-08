// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/GTD.sol";
import "forge-std/console.sol";


contract DeployGTDScript is Script {
    function run() external {
        vm.startBroadcast();

        
        GTD token = new GTD("GTD Token", "MTK", 1000000 * 10 ** 18);

        console.log("Contract deployed at:", address(token));
        console.log("Balance of Deployer:", token.balanceOf(address(this)));  // Corrected to check deployer's balance


        // GTD newAddress = new GTD("GTD Token", "MTK", 0);

        // console.log("Contract deployed at zero:", address(newAddress));
        // console.log("Balance of Deployer:", newAddress.balanceOf(address(newAddress)));

        vm.stopBroadcast();
    }
}
