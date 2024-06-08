// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/GTD.sol";

contract DeployGTDScript is Script {
    function run() external {
        vm.startBroadcast();

        
        GTD token = new GTD("GTD Token", "MTK", 1000000 * 10 ** 18);

        console.log("Contract deployed at:", address(token));


        vm.stopBroadcast();
    }
}
