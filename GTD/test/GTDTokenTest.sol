// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/GTD.sol";

contract GTDTest is Test {
    GTD token;
    address recipient;
    uint256 initialSupply = 1000 ether;
    
    function setUp() public {
        token = new GTD("GTD Token", "MTK", initialSupply);
        recipient = address(0x5c897F49CacE5DA23880a4f7AB18Aab0E9d69b25);
    }
    
    function testTransferFunction() public {
        uint256 amount = 100 ether;
        uint256 burnAmount = amount / 10;
        uint256 transferAmount = amount - burnAmount;

        uint256 senderInitialBalance = token.balanceOf(address(this));
        uint256 recipientInitialBalance = token.balanceOf(recipient);
      
        token.transfer(recipient, amount);
        assertEq(token.balanceOf(recipient), recipientInitialBalance + transferAmount, "Recipient balance should be incremented by the transfer amount minus the burn amount");
        assertEq(token.balanceOf(address(this)), senderInitialBalance - amount, "Sender balance should be decremented by the full amount");
        assertEq(token.totalSupply(), initialSupply - burnAmount, "Total supply should decrease by the burn amount");
    }
}
