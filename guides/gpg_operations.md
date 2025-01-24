# GPG Operations

This Markdown file serves as a comprehensive guide and reference for performing various GPG (GnuPG) operations using command-line interfaces. GPG is a widely-used encryption tool that allows users to generate cryptographic key pairs, encrypt and decrypt messages, manage keys securely, and more. This script includes detailed documentation and command examples for each GPG operation, aimed at helping users effectively manage cryptographic keys and encrypted communications.

## Table of Contents

Here's the table of contents (TOC) based on your provided content:

1. [Generating New Keys](#1-generating-new-keys)
2. [Listing all GPG keys](#2-listing-all-gpg-keys)
3. [Exporting and Importing Own Public Key](#3-exporting-and-importing-own-public-key)
4. [Encrypting a Message Using Someone's Public Key](#4-encrypting-a-message-using-someones-public-key)
    - [Quick Encryption of a Small Message](#quick-encryption-of-a-small-message)
5. [Decrypting an Encrypted Message](#5-decrypting-an-encrypted-message)
6. [Encrypt/Decrypt a File](#6-encryptdecrypt-a-file)
    - [Encrypt a File](#encrypt-a-file)
    - [Decrypt a File](#decrypt-a-file)
7. [Saving Own Private Key Securely](#7-saving-own-private-key-securely)
8. [Importing Private Key on New Device](#8-importing-private-key-on-new-device)
9. [Deleting a GPG Key Pair](#9-deleting-a-gpg-key-pair)
    - [Delete Public Key](#delete-public-key)
    - [Delete Secret Key](#delete-secret-key)
10. [Signing a Message or File](#10-signing-a-message-or-file)
    - [Step 1: Sign the File](#step-1-sign-the-file)
    - [Step 2: Verify the Signature (Recipient's Part)](#step-2-verify-the-signature-recipients-part)
11. [GPG Key Fingerprint](#11-gpg-key-fingerprint)
    - [Viewing Key Fingerprint](#viewing-key-fingerprint)
---

## 1. [Generating New Keys](#1-generating-new-keys)

```bash
gpg --full-generate-key
```

- **Description**: Generates a new GPG key pair.
- **Details**: Prompts you to enter your name, email address, and a passphrase for the key.

## 2. [Listing all GPG keys](#2-listing-all-gpg-keys)
Use the following command to list all public and secret keys
```bash
gpg --list-keys  # For listing public keys
gpg --list-secret-keys  # For listing secret keys
```
Note that you can see the fingerprint of the key when you list the keys!

## 3. [Exporting and Importing Own Public Key](#3-exporting-and-importing-own-public-key)
Use the following command to export your public key. You can use alternatively the associated email id in place of KEY_FINGERPRINT.
```bash
gpg --armor --output public_key.asc --export <KEY_FINGERPRINT>
```
To import a public key stored in a file `public_key.asc` use the following
```bash
gpg --import public_key.asc
```

## 4. [Encrypting a Message Using Someone's Public Key](#4-encrypting-a-message-using-someones-public-key)

```bash
gpg --armor --output encrypted_message.asc --encrypt --recipient <PUBLIC_KEY_FINGERPRINT> message.txt
```

### Quick Encryption of a Small Message

```bash
echo "Here is a small secret message" | gpg --armor --encrypt --recipient <PUBLIC_KEY_FINGERPRINT> message.txt
```

## 5. [Decrypting an Encrypted Message](#5-decrypting-an-encrypted-message)
The following command will decrypt the message. Note it requires the secret key to be present in the GPG keyrings.
```bash
gpg --output decrypted_message.txt --decrypt encrypted_message.asc
```

## 6. [Encrypt/Decrypt a File](#6-encryptdecrypt-a-file)

### Encrypt a File

```bash
gpg --output encrypted_file.gpg --encrypt --recipient <PUBLIC_KEY_FINGERPRINT> file_to_encrypt.txt
```

### Decrypt a File

```bash
gpg --output decrypted_file.txt --decrypt encrypted_file.gpg
```

## 7. [Saving Own Private Key Securely](#7-saving-own-private-key-securely)

```bash
gpg --armor --output private_key.asc --export-secret-keys your.email@example.com
```

## 8. [Importing Private Key on New Device](#8-importing-private-key-on-new-device)

```bash
gpg --import private_key.asc
```

## 9. [Deleting a GPG Key Pair](#9-deleting-a-gpg-key-pair)

### Delete Public Key

```bash
gpg --delete-key <KEY_FINGERPRINT>
```

### Delete Secret Key

```bash
gpg --delete-secret-key <KEY_FINGERPRINT>
```

## 10. [Signing a Message or File](#10-signing-a-message-or-file)
Here we'll guide you through the process of signing a file with your GPG key pair and verifying the signature. This ensures that the recipient knows the file came from you and has not been tampered with. Suppose you want to sign the file `spam.txt`.

### Step 1: Sign the File

1. **Generate the Signature:**

   Use the following command to create a detached signature for `spam.txt`:
     ```sh
   gpg --armor --detach-sign --output spam.txt.sig spam.txt
   ```

   This command generates a file `spam.txt.sig` which contains the digital signature.

2. **Send the File and Signature:**

   Send both `spam.txt` and `spam.txt.sig` to your recipient via email, file transfer, or any other preferred method.

### Step 2: Verify the Signature (Recipient's Part)

1. **Import Your Public Key:**

   The recipient needs to import your public key to verify the signature. Export your public key and send it to the recipient:
   ```sh
   gpg --export --armor your_email@example.com > your_public_key.asc
   ```

   The recipient can import your public key using the following command:
   ```sh
   gpg --import your_public_key.asc
   ```

2. **Verify the Signature:**

   The recipient can verify the signature with the following command:
   ```sh
   gpg --verify spam.txt.sig spam.txt
   ```

   If the signature is valid and the file has not been altered, the recipient will see a message indicating that the signature is good and that it came from you.

## 11. [GPG Key Fingerprint](#11-gpg-key-fingerprint)
The fingerprint of a GPG (GNU Privacy Guard) key is a unique identifier that represents the key itself. It serves as a cryptographic hash of the key's public component and is used to uniquely identify the key without revealing the key itself.

### Viewing Key Fingerprint

To view the fingerprint of a GPG key, use the following command:

```bash
gpg --fingerprint your.email@example.com
```

- **Description**: Displays the fingerprint of a GPG key.
- **Details**: Replace 'your.email@example.com' with the email associated with the key you want to view.