// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import "@openzeppelin/contracts/access/manager/AccessManaged.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

/**
 * @dev Share token contract
 */
contract Share is ERC1155, AccessManaged {
    uint256 private _counter;

    mapping(uint256 tokenId => uint256) public _assetId;

    constructor(address manager) ERC1155("n/a") AccessManaged(manager) {}

    function mint(
        address receiver,
        uint256 assetId,
        uint256 amount
    ) public payable restricted {
        _mint(receiver, assetId, amount, "");
    }

    function burn(
        address from,
        uint256 assetId,
        uint256 amount
    ) external restricted {
        _burn(from, assetId, amount);
    }
}
