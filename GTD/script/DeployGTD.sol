// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/GTD.sol";

contract DeployGTD is Script {
    function run() external {
        vm.startBroadcast();

        new GTD("GTD", "MTK", 1000000 * 10 ** 18);

        vm.stopBroadcast();
    }
}
