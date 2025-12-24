// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IKYCRegistry {
    function isKYCCompleted(address user) external view returns (bool);
}

/**
 * @title IndonesiaPropertyToken
 * @author Revaldo
 * @notice ERC-20 token representing fractional ownership of Indonesian real estate
 */
 
contract IndonesiaPropertyToken is ERC20, Ownable {
    IKYCRegistry public kycRegistry;

    constructor(address _kycRegistry)
        ERC20("Indonesia Property Token", "IPT")
    {
        kycRegistry = IKYCRegistry(_kycRegistry);
    }

    modifier onlyKYC(address user) {
        require(
            kycRegistry.isKYCCompleted(user),
            "IPT: address not KYC verified"
        );
        _;
    }

    function mint(address to, uint256 amount)
        external
        onlyOwner
        onlyKYC(to)
    {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        if (from != address(0)) {
            require(
                kycRegistry.isKYCCompleted(from),
                "IPT: sender not KYC verified"
            );
        }

        if (to != address(0)) {
            require(
                kycRegistry.isKYCCompleted(to),
                "IPT: receiver not KYC verified"
            );
        }

        super._beforeTokenTransfer(from, to, amount);
    }
}
