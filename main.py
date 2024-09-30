from xrpl.wallet import Wallet
from mnemonic import Mnemonic



def generate_wallet():
    # Generate a wallet from random bytes
    seed = (lambda f: f.read(16))(open("/dev/random", "rb"))
    wallet = Wallet.from_entropy(seed.hex())
    print(f"Wallet Address: {wallet.classic_address}")
    print(f"Public Key: {wallet.public_key}")
    print(f"Private Key: {wallet.private_key}")

    # Generate a new mnemonic phrase (BIP-39)
    mnemo = Mnemonic("english")
    seed_mnemonic = mnemo.to_mnemonic(seed)
    print(seed_mnemonic)

    # Check that seed matches
    mnemonic_entropy = mnemo.to_entropy(seed_mnemonic)
    print(seed.hex())
    print(mnemonic_entropy.hex())
    if seed.hex() != mnemonic_entropy.hex():
        raise RuntimeError("SEED MISMATCH!")
    print("\n")
    return wallet

