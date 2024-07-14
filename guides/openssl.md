# OpenSSL Commands for AES-256-CBC Encryption and Decryption

## 1. Generate a 256-bit AES Key

Use the following command to generate a 256-bit AES key and save it to `aes_key.asc`:

```sh
openssl rand -base64 32 > aes_key.asc
```

## 2. Encrypt a File

To encrypt a file (`spam.txt`) using the AES-256-CBC algorithm with the generated key, use the following command:

```sh
openssl enc -aes-256-cbc -salt -pbkdf2 -in spam.txt -out encrypted_file.enc -pass file:./aes_key.asc
```

- `-aes-256-cbc`: Specifies the AES-256-CBC encryption algorithm.
- `-salt`: Adds a salt to the encryption to enhance security.
- `-pbkdf2`: Uses the PBKDF2 key derivation function.
- `-in spam.txt`: Specifies the input file to encrypt.
- `-out encrypted_file.enc`: Specifies the output file for the encrypted data.
- `-pass file:./aes_key.asc`: Specifies the file containing the password/key.

## 3. Decrypt the Encrypted File

To decrypt the previously encrypted file (`encrypted_file.enc`), use the following command:

```sh
openssl enc -d -aes-256-cbc -pbkdf2 -in encrypted_file.enc -out decrypted_file.txt -pass file:./aes_key.asc
```

- `-d`: Indicates decryption mode.
- `-aes-256-cbc`: Specifies the AES-256-CBC encryption algorithm.
- `-pbkdf2`: Uses the PBKDF2 key derivation function.
- `-in encrypted_file.enc`: Specifies the input file to decrypt.
- `-out decrypted_file.txt`: Specifies the output file for the decrypted data.
- `-pass file:./aes_key.asc`: Specifies the file containing the password/key.

By following these commands, you can securely encrypt and decrypt your files using OpenSSL's AES-256-CBC algorithm.
