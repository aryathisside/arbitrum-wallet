// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DepositWithdraw {
    struct Deposit {
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Deposit[]) public deposits;
    mapping(address => bool) public hasDeposited;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    modifier onlyDepositor() {
        require(hasDeposited[msg.sender], "You have not deposited any funds.");
        _;
    }

    modifier canWithdraw(uint256 depositIndex) {
        require(depositIndex < deposits[msg.sender].length, "Invalid deposit index.");
        require(
            block.timestamp >= deposits[msg.sender][depositIndex].timestamp + 5 minutes,
            "You can only withdraw after 5 minutes of depositing."
        );
        _;
    }

    function deposit() external payable {
        require(msg.value > 0, "Must deposit more than 0 ETH.");
        
        // Add the deposit to the user's deposits
        deposits[msg.sender].push(Deposit(msg.value, block.timestamp));
        hasDeposited[msg.sender] = true;

        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 depositIndex) external onlyDepositor canWithdraw(depositIndex) {
        uint256 amountToWithdraw = deposits[msg.sender][depositIndex].amount;

        // Reset the deposit amount to zero to avoid re-entrancy attacks
        deposits[msg.sender][depositIndex].amount = 0;

        // Transfer the amount back to the user
        payable(msg.sender).transfer(amountToWithdraw);

        emit Withdrawn(msg.sender, amountToWithdraw);
    }

    function getDepositDetails(uint256 depositIndex) external view returns (uint256 amount, uint256 timestamp) {
        require(depositIndex < deposits[msg.sender].length, "Invalid deposit index.");
        Deposit memory deposit = deposits[msg.sender][depositIndex];
        return (deposit.amount, deposit.timestamp);
    }

    function getDepositCount() external view returns (uint256) {
        return deposits[msg.sender].length;
    }
}
