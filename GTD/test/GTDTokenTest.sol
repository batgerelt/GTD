// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/GTD.sol";
import "forge-std/console2.sol";


contract GTDTest is Test {
    GTD token;
    address recipient = address(0x5c897F49CacE5DA23880a4f7AB18Aab0E9d69b25);
    uint256 initialSupply = 1000 ether;

    function setUp() public {
        token = new GTD("GTD Token", "MTK", initialSupply);
    }
    

    function testTransferFunction() public {
      uint256 amount = 100 ether;
      token.transfer(recipient, amount);

      uint256 expectedTotalSupply = initialSupply - (amount / 10);
      assertEq(token.totalSupply(), expectedTotalSupply, "Total supply should decrease by the burned amount");
      console.log("Total supply after transfer:");
      console.logUint(token.totalSupply());
    }
}
