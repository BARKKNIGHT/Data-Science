def proof_of_work(block, difficulty):
    nonce = 0
    while True:
        block.nonce = nonce
        hash = calculate_hash(block)
        if hash.startswith('0' * difficulty):
            return nonce
        nonce += 1
