python-aead
===========

[![Build Status](https://travis-ci.org/Ayrx/python-aead.svg?branch=master)](https://travis-ci.org/Ayrx/python-aead)
[![Coverage Status](https://img.shields.io/coveralls/Ayrx/python-aead.svg)](https://coveralls.io/r/Ayrx/python-aead)

python-aead is a implementation of an algorithm for authenticated encryption 
with associated data (AEAD). It uses the AES cipher in CBC mode and HMAC-SHA256
for message authentication. It is based on an [IETF Internet Draft](http://tools.ietf.org/html/draft-mcgrew-aead-aes-cbc-hmac-sha2-05) 
from David McGrew.

python-aead aims to be opinionated about algorithm choice. It is essentially
AES_128_CBC_HMAC_SHA_256. If more flexibility is required, I highly recommend
using the [PyCA cryptography library](https://github.com/pyca/cryptography)
that provides the cryptographic primitives python-aead uses.

python-aead supports and is tested against Python versions 2.6 - 3.4 as well as PyPy. 

# How to use

python-aead aims to provide a very simple interface. The module contains a 
single class that can be imported.

```python
from aead import AEAD
```

An encryption key is required to initialize the object. The key has to be 32 
bytes long and encoded with base64url as specified in 
[RFC 4648](http://tools.ietf.org/html/rfc4648). The library provides a 
convenient method for generating a random key but any key meeting the criteria
can be used.

```python
cryptor = AEAD(AEAD.generate_key())
```

After initializing the object, encrypting data is a simple matter. The 
`.encrypt()` method takes two parameters, the first being the data you want to
encrypt and the second being associated data that you want to authenticate but
not encrypt.

```python
ct = cryptor.encrypt(b"Hello, World!", b"Additional Data")
```

`.encrypt()` returns a base64url encoded cipher text.

Decrypting the cipher text is a simple matter as well. The `.decrypt()` method 
takes two parameters, the first being the cipher text that needs decrypting and 
the second being the associated data that was authenticated.

```python
cryptor.decrypt(ct, b"Additional Data")
```

If the cipher text is corrupted or the associated data provided during the 
decryption process does not match the associated data provided during 
encryption, a `ValueError` is raised.

# License

python-aead is made available under both the BSD and Apache Software License 
Version 2.0 licenses. See the `LICENSE.BSD` and `LICENSE.APACHE` files for the
exact terms of the license.

# Bug reports, security issues and contributing

python-aead welcomes any bug reports, fixes and suggestions. If an issue is 
security-sensitive, please email me directly at terrycwk1994@gmail.com.

If contributing a patch, please adhere to the following guidelines:

* Follow PEP 8. The test suite runs a flake8 lint to catch any issues.
* Keep patches small to ease the review process. Bigger patches can be broken
  up in logical chunks.
* Ensure that test coverage remains at 100%.
