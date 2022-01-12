"""
Collin Stratton
Isac Artzi
CST-461

Create a basic blockchain
"""

# imports
import datetime

# block class
class Block:
    # constructor containing everything stored in the block
    def __init__(self, index, data, timestamp, previous_hash, validator, signature):
        self.id = index
        self.data = data
        self.timestamp = timestamp
        self.hash = hash((index, data, timestamp, previous_hash))
        self.previous_hash = previous_hash
        self.validator = validator
        self.signature = signature

# blockchain class
class Blockchain:
    # constructor creating the chain and initial block
    def __init__(self):
        self.chain = []
        self.add_block()
        pass

    # add block to the chain
    def add_block(self, data=None):
        # check if there is a previous block
        previous_hash = 0
        if len(self.chain) > 0:
            previous_hash = self.chain[-1].hash

        # create a new block
        block = Block(len(self.chain), data, datetime.datetime.now(), previous_hash, 0, 0)
        self.chain.append(block)

        return block

    # print the chain
    def print_chain(self):
        for block in self.chain:
            print(block.id, block.data, block.timestamp, block.hash, block.previous_hash)

blockchain = Blockchain()
blockchain.add_block("First Block")
blockchain.print_chain()
