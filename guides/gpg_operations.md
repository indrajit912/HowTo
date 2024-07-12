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

## 11. GPG Key Fingerprint
The fingerprint of a GPG (GNU Privacy Guard) key is a unique identifier that represents the key itself. It serves as a cryptographic hash of the key's public component and is used to uniquely identify the key without revealing the key itself.

### Viewing Key Fingerprint

To view the fingerprint of a GPG key, use the following command:

```bash
gpg --fingerprint your.email@example.com
```

- **Description**: Displays the fingerprint of a GPG key.
- **Details**: Replace 'your.email@example.com' with the email associated with the key you want to view.