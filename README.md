# My Personal Savings Bank 💰

Hi! This is a beginner-friendly smart contract I built to understand how Ethereum works. Think of it as a digital piggy bank on the blockchain.

The rules are simple: **Anyone can put money in, but only I (the owner) can take it out.**

## What it does

* **Deposit:** You (or anyone else) can send Ether to this contract to save it.
* **Check Balance:** You can check how much money is currently inside the vault.
* **Withdraw:** This is the secure part—only the wallet that created this contract is allowed to withdraw the funds.

## How the "Security Guard" Works

The main logic relies on two simple concepts: remembering who created the contract and checking ID at the door.

### 1. Setting the Boss (The Owner)
When I first put this contract on the blockchain (deploy it), a special function called `constructor()` runs automatically. It does one important thing:
owner = msg.sender;
msg.sender is just code for "the person currently interacting."
Since I am the one deploying it, the contract takes my wallet address and saves it in the owner variable forever.
To protect the withdrawal function, I created a rule (modifier) called onlyOwner. It acts like a bouncer:
It checks if the person clicking the button is the same person saved in step 1.

If not, it stops everything immediately.
Finally, I attached this guard to the withdraw function using the onlyOwner keyword:
By adding onlyOwner to the function name, the contract knows to run the security check before allowing any money to be moved.
