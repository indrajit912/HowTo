# GPG Operations

This Markdown file serves as a comprehensive guide and reference for performing various GPG (GnuPG) operations using command-line interfaces. GPG is a widely-used encryption tool that allows users to generate cryptographic key pairs, encrypt and decrypt messages, manage keys securely, and more. This script includes detailed documentation and command examples for each GPG operation, aimed at helping users effectively manage cryptographic keys and encrypted communications.

## Table of Contents

1. [Generating New Keys](#1-generating-new-keys)
2. [Exporting and Importing Own Public Key](#2-exporting-and-importing-own-public-key)
3. [Encrypting a Message Using Someone's Public Key](#3-encrypting-a-message-using-someones-public-key)
4. [Decrypting an Encrypted Message](#4-decrypting-an-encrypted-message)
5. [Encrypt/Decrypt a File](#5-encryptdecrypt-a-file)
6. [Saving Own Private Key Securely](#6-saving-own-private-key-securely)
7. [Importing Private Key on New Device](#7-importing-private-key-on-new-device)
8. [Deleting a GPG Key Pair](#8-deleting-a-gpg-key-pair)
9. [Signing a Message or File](#9-signing-a-message-or-file)
10. [Listing all GPG keys](#10-listing-all-gpg-keys)
11. [GPG Key Fingerprint](#11-gpg-key-fingerprint)

---

## 1. Generating New Keys

```bash
gpg --full-generate-key
```

- **Description**: Generates a new GPG key pair.
- **Details**: Prompts you to enter your name, email address, and a passphrase for the key.

### Setting an Expiration Date for a GPG Private Key

```bash
gpg --full-generate-key --expire-date 2y
```

## 2. Exporting and Importing Own Public Key

```bash
gpg --armor --output public_key.asc --export <youremail@example.com>
```

```bash
gpg --import public_key.asc
```

## 3. Encrypting a Message Using Someone's Public Key

```bash
gpg --armor --output encrypted_message.asc --encrypt --recipient recipient@example.com message.txt
```

### Quick Encryption of a Small Message

```bash
echo "Here is a small secret message" | gpg --armor --encrypt --recipient recipient@example.com > message.txt
```

## 4. Decrypting an Encrypted Message

```bash
gpg --output decrypted_message.txt --decrypt encrypted_message.asc
```

## 5. Encrypt/Decrypt a File

### Encrypt a File

```bash
gpg --output encrypted_file.gpg --encrypt --recipient recipient@example.com file_to_encrypt.txt
```

### Decrypt a File

```bash
gpg --output decrypted_file.txt --decrypt encrypted_file.gpg
```

## 6. Saving Own Private Key Securely

```bash
gpg --armor --output private_key.asc --export-secret-keys your.email@example.com
```

## 7. Importing Private Key on New Device

```bash
gpg --import private_key.asc
```

## 8. Deleting a GPG Key Pair

### Delete Public Key

```bash
gpg --delete-key your.email@example.com
```

### Delete Secret Key

```bash
gpg --delete-secret-key your.email@example.com
```

## 9. Signing a Message or File

### Sign a Message

```bash
gpg --output signed_message.asc --sign message.txt
```

### Sign a File

```bash
gpg --output signed_file.gpg --sign file_to_sign.txt
```

### Verify a Signed File

```bash
gpg --verify signed_file.gpg
```

## 10. Listing all GPG keys

```bash
gpg --list-keys
```

```bash
gpg --list-secret-keys
```

## 11. GPG Key Fingerprint
The fingerprint of a GPG (GNU Privacy Guard) key is a unique identifier that represents the key itself. It serves as a cryptographic hash of the key's public component and is used to uniquely identify the key without revealing the key itself.

### Viewing Key Fingerprint

To view the fingerprint of a GPG key, use the following command:

```bash
gpg --fingerprint your.email@example.com
```

- **Description**: Displays the fingerprint of a GPG key.
- **Details**: Replace 'your.email@example.com' with the email associated with the key you want to view.