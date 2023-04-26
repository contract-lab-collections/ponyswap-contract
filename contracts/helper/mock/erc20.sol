// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("Mock TOKEN", "mTOKEN") {
        _mint(msg.sender, 10000000000*10**18);
    }
}

contract MockWETH is ERC20 {
    constructor() ERC20("WETH", "WETH") {}

    function deposit() external payable {
        _mint(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        _burn(msg.sender, _amount);
        (bool sent, ) = msg.sender.call{value: _amount, gas: 50000}("");
        require(sent, "failed to send");
    }

    receive() external payable {}
}

