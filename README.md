## How to deploy
1. Deploy the SafeRoom Contract first (ensure to deploy this with some ether value)
2. Copy the contract address of SafeRoom
3. Deploy Attack contract with the SafeRoom address 
4. Copy Attack contract address
5. Transfer 1 ether to Attack contract
6. This will trigger the recieve function
7. Which in turn calls the attack function 
8. This empties Saferoom balance into Attack Contract
