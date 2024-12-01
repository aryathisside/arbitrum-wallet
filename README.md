# Arbitrum Wallet Generator and Domain Minter

This script allows you to generate Ethereum wallets, transfer $5 worth of ETH to each wallet, and mint unique `.fam` domains on the Arbitrum blockchain. It uses ethers.js for wallet management and fund transfers, and Solidity for managing domain minting.

## Features
- Initializes a master wallet using a private key.
- Generates new Ethereum wallets.
- Transfers $5 worth of ETH to each generated wallet.
- Mints a unique `.fam` domain for each wallet using a custom smart contract.
- Checks if a domain is already minted before attempting to mint.
- Handles errors during transactions and retries in case of failures.

## Prerequisites

Make sure you have the following installed:

- Node.js v14.x or higher
- NPM or Yarn

## Installation

1. Clone the repository:

    ```bash
    git clone <your-repository-url>
    cd <your-repository-directory>
    ```

2. Install the required dependencies:

    ```bash
    npm install
    ```

## Environment Setup

Before running the script, create an `.env` file in the root directory and provide your own values for the following environment variables:

```bash
ARBITRUM_TESTNET_RPC=your_arbitrum_testnet_rpc_url
MASTER_PRIVATE_KEY=your_master_wallet_private_key
```


**Console For Index.js**
Master Wallet Address: 0x2Ba1Bf6aB49c0d86CDb12D69A777B6dF39AB79D9
Generated Wallet 1: 0x196D3514FBee96e8330A5a148BA07c2f984BeE54
Generated Wallet 2: 0x780435674938287a56C9E00654eBe7e7eb3dF758
Generated Wallet 3: 0x6beD92F5BbfF21F0656474d01af26D84b2eC6394
Generated Wallet 4: 0x8Ebea22e7221f249c845a22A5aAfB7771B1F189F
Generated Wallet 5: 0xCa43E6D8D642a5CAB9EA2e28f9aF1c326d8c4125
ethPriceInUSD: 2636.11
ethAmount: 0.001896734203049190
Sent $5 worth of ETH to 0x196D3514FBee96e8330A5a148BA07c2f984BeE54, Transaction Hash: 0xa3b303ee6064d47998feb9281018dc314ce8265dbdabcc0afb8b65ab51e55ff7
Sent $5 worth of ETH to 0x780435674938287a56C9E00654eBe7e7eb3dF758, Transaction Hash: 0xff442ad61d6adba08aeaa867ff257a11d85b47f8047e0f2fd1b179e32614f521
Sent $5 worth of ETH to 0x6beD92F5BbfF21F0656474d01af26D84b2eC6394, Transaction Hash: 0xd626b638818c700c2b8452b715c5908b09b109ff3c7fa9d93cd7e22a064716e4
Sent $5 worth of ETH to 0x8Ebea22e7221f249c845a22A5aAfB7771B1F189F, Transaction Hash: 0x8ccc7363dc52c3fc21657e4a8ba74b3f4209c91ca8a829fbe25ae5e7dd46dd78
Sent $5 worth of ETH to 0xCa43E6D8D642a5CAB9EA2e28f9aF1c326d8c4125, Transaction Hash: 0x40e3320ddf2feb3e51e75829d5739388ed7d2b0afc74c4a0a68b60cd6ce0f50b
Minted domain domain-196D3514.fam for wallet 0x196D3514FBee96e8330A5a148BA07c2f984BeE54, Transaction Hash: 0xd033cc45dcdcd067ec7c5f50a05a0ab5e0996ab168c30e0cec7672302f8fd528
Minted domain domain-78043567.fam for wallet 0x780435674938287a56C9E00654eBe7e7eb3dF758, Transaction Hash: 0xdd52db560893e7fd829b455f998845fa2e45268d21c37dd675e15d6446a7f8ff
Minted domain domain-6beD92F5.fam for wallet 0x6beD92F5BbfF21F0656474d01af26D84b2eC6394, Transaction Hash: 0x9bd255bd19c80080eaf36049261c6f607b42b883fee992ecc0ee0a221e2035a1
Minted domain domain-8Ebea22e.fam for wallet 0x8Ebea22e7221f249c845a22A5aAfB7771B1F189F, Transaction Hash: 0x79c898e1f7d66140f0d4e7f104d5523973b66f88b1dae8a4d3f3bb1d325a853a
Minted domain domain-Ca43E6D8.fam for wallet 0xCa43E6D8D642a5CAB9EA2e28f9aF1c326d8c4125, Transaction Hash: 0x74bc28be3b272fbd362f1b9851f15deaea6c7a2468dc29d27a1c982a0e0ae62e
All tasks completed successfully.

**Function to decrypt a text**
function decrypt(text) {
    const textParts = text.split(':');
    const iv = Buffer.from(textParts.shift(), 'hex');
    const encryptedText = Buffer.from(textParts.join(':'), 'hex');
    const decipher = crypto.createDecipheriv('aes-256-cbc', Buffer.from(ENCRYPTION_KEY), iv);
    let decrypted = decipher.update(encryptedText, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
}