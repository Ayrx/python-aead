import pytest

from aead import AEAD


hypothesis = pytest.importorskip("hypothesis")


@hypothesis.given(
    hypothesis.strategies.binary(),
    hypothesis.strategies.binary()
)
def test_round_trip_encrypt_decrypt(plaintext, associated_data):
    cryptor = AEAD(AEAD.generate_key())
    ct = cryptor.encrypt(plaintext, associated_data)
    assert plaintext == cryptor.decrypt(ct, associated_data)
