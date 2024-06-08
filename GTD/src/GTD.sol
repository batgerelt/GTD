// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "forge-std/console.sol";

contract GTD is ERC20, Ownable {
    address public constant burnAddress = 0x0000000000000000000000000000000000000000;

    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) Ownable(msg.sender) {
        _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }


    // Overrided
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        uint256 feeAmount = amount / 10; 
        uint256 amountAfterFee = amount - feeAmount;

        burn(feeAmount); 
        // _transfer(_msgSender(), burnAddress, feeAmount); 
        _transfer(_msgSender(), recipient, amountAfterFee); 

        return true;
    }

    // Overrided
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        uint256 feeAmount = amount / 10; 
        uint256 amountAfterFee = amount - feeAmount;

        burn(feeAmount); 
        // _transfer(_msgSender(), burnAddress, feeAmount); 
        _transfer(sender, recipient, amountAfterFee); 

        _approve(sender, _msgSender(), allowance(sender, _msgSender()) - amount);
        return true;
    }

}
