# Cryptomon Project
CST-461 project to create a substantial project with the skills and knowledge learned from the class. 

# How To Run
- Launch Ganache
- Update all Cryptomon Ownership in order to be deployed
- Deploy Cryptomon contract
- Launch Cryptomon Battle Hub
- Input addresses associated with NFTs you wish to battle

# How To Battle
- Turn order is determined by the speed of the two Cryptomon that are battling. The faster a Cryptomon the sooner it will get a turn
- On a Cryptomon’s turn, you are able to choose between the two available moves associated with said NFT. These are unique to each NFT. 
- Each move will have a damage number and a miss rate out of 100. When a move is selected, the move's miss rate is compared against a random number to - determine if the move hits the opponent. If the move hits the opponent, the opponent’s hp is lowered by an equal number to the move’s damage.
- When a Cryptomon’s HP is lowered to 0. The game ends and the Cryptomon existing with HP above 0 wins the battle.