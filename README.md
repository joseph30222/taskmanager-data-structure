1. Purpose: 
The contract is a task manager for adding, updating, deleting, and viewing tasks on the blockchain
How to Test:
1. Open Remix (https://remix.ethereum.org/).
2. Create TaskManager.sol and paste the code.
3. Compile with Solidity 0.8.0.
4. Deploy on JavaScript VM.
5. Test functions:
   - addTask("Test task")
   - updateTask(1, "Updated task", 1)
   - deleteTask(1)
   - getTask(1)
   - getAllTaskIds()
   Challenges:
Example: "I struggled with array deletion in deleteTask. I learned to use swap-and-pop to remove an ID."
Example: "Understanding events was new. I checked Remix’s console to verify them."

Transaction ID.
   contract address:0x4fcfa99805c36c17760faf0efdf0cfecac5a46a5

   
