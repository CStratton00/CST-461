import datetime

class Block:
    def __init__(self, index, data, date, data_hash, previous_hash):
        self.id = index
        self.data = data
        self.date = date
        self.hash = data_hash
        self.previous_hash = previous_hash

class Blockchain:
    def __init__(self):
        self.chain = []
        self.add_block()
        pass

    def add_block(self, data=None):
        # check if there is a previous block
        previous_hash = 0000000000000000000
        if len(self.chain) > 0:
            previous_hash = self.chain[-1].hash

        block = Block(len(self.chain), data, datetime.datetime.now(), hash(data), previous_hash)
        self.chain.append(block)

        return block

    def print_chain(self):
        for block in self.chain:
            print(block.id, block.data, block.date, block.hash, block.previous_hash)

blockchain = Blockchain()
blockchain.add_block("First Block")
blockchain.print_chain()
