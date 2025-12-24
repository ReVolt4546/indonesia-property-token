// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title KYCRegistry
 * @author Revaldo
 * @notice Manages KYC/AML whitelisting for compliant RWA tokens
 */
contract KYCRegistry {
    address public admin;

    mapping(address => bool) private kycApproved;

    event KYCApproved(address indexed user);
    event KYCRevoked(address indexed user);

    modifier onlyAdmin() {
        require(msg.sender == admin, "KYCRegistry: caller is not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addKYC(address user) external onlyAdmin {
        kycApproved[user] = true;
        emit KYCApproved(user);
    }

    function revokeKYC(address user) external onlyAdmin {
        kycApproved[user] = false;
        emit KYCRevoked(user);
    }

    function isKYCCompleted(address user) external view returns (bool) {
        return kycApproved[user];
    }
}
