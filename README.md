# 🇮🇩 IndonesiaPropertyToken – RWA Real Estate DApp

IndonesiaPropertyToken is a Real World Asset (RWA) smart contract system that enables compliant tokenization of Indonesian real estate on the blockchain. By using ERC-20 tokens and on-chain KYC enforcement, this project allows:
- Fractional real estate ownership
- KYC/AML-compliant investor participation
- Transparent and secure on-chain ownership
- Admin-controlled compliance enforcement

## RWA Concept
Traditional real estate investment requires large capital and is illiquid. Through tokenization, property ownership can be divided into smaller units, allowing investors to participate with lower capital while maintaining regulatory compliance.

## Smart Contract Architecture
This project consists of **two integrated smart contracts**:

### 1️KYCRegistry.sol
- Manages KYC/AML whitelist
- Only admin can approve or revoke users
- Acts as the off-chain compliance result stored on-chain

### 2️IndonesiaPropertyToken.sol
- ERC-20 token representing fractional property ownership
- Enforces KYC checks on:
  - Minting
  - Transfers
- Only KYC-approved addresses can hold or transfer tokens

## Compliance Mechanism
- KYC verification is performed off-chain
- Approved investor addresses are whitelisted in `KYCRegistry`
- `IndonesiaPropertyToken` checks KYC status before minting and transfers
- Non-KYC addresses cannot send or receive tokens
This design reflects real-world RWA compliance requirements.

## Project Structure
contracts/
├── KYCRegistry.sol
└── IndonesiaPropertyToken.sol

## Author
Revaldo Valerian
