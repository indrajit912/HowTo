# GPG Operations

This Markdown file serves as a comprehensive guide and reference for performing various GPG (GnuPG) operations using command-line interfaces. GPG is a widely-used encryption tool that allows users to generate cryptographic key pairs, encrypt and decrypt messages, manage keys securely, and more. This script includes detailed documentation and command examples for each GPG operation, aimed at helping users effectively manage cryptographic keys and encrypted communications.

The script covers essential tasks such as:

1. **Generating New Keys**: Creating new GPG key pairs for encryption and digital signatures.
2. **Importing and Exporting Keys**: Managing the import and export of public and private keys.
3. **Encrypting and Decrypting Messages**: Using GPG to encrypt and decrypt messages using public and private keys.
4. **Encrypting and Decrypting Files**: Securely encrypting and decrypting files using GPG.
5. **Managing Key Security**: Exporting private keys securely and importing them on new devices.
6. **Deleting Keys**: Removing GPG key pairs from your system when no longer needed.
7. **Setting Key Expiration**: Configuring expiration dates for enhanced key management.

This script aims to provide clear instructions and examples for each operation, ensuring users can leverage GPG effectively while maintaining security best practices. Each section includes commands and explanations to facilitate easy implementation and understanding.


## 1. Create New Keys

```bash
gpg --full-generate-key
```

- **Description**: Generates a new GPG key pair.
- **Details**: Prompts you to enter your name, email address, and a passphrase for the key.

GPG (GnuPG) allows you to set an expiration date for your private key when you generate it. Setting an expiration date is a good practice for security reasons, as it ensures that your key becomes invalid after a specified period, prompting you to review and potentially renew it.

### Setting an Expiration Date for a GPG Private Key
When generating a new key pair with gpg --full-generate-key, you can specify how long the key should be valid using the --expire-date option. For example:

```bash
gpg --full-generate-key --expire-date 2y
```
You can replace 2y with other values such as 1y (1 year), 6m (6 months), 10d (10 days), or a specific date in YYYY-MM-DD format (2025-12-31).

## 2. Exporting and Importing Own Public Key
To export a public key use:
```bash
gpg --armor --output public_key.asc --export <youremail@example.com>
```
To import a public key use:
```bash
gpg --import public_key.asc
```

- **Description**: Imports your public key into your GPG keyring.
- **Note**: Replace 'your_public_key.asc' with the actual file containing your public key.

## 3. Encrypting a Message Using Someone's Public Key

```bash
gpg --armor --output encrypted_message.asc --encrypt --recipient recipient@example.com message.txt
```

- **Description**: Encrypts a message using the recipient's public key.
- **Details**: Replace 'recipient@example.com' with the recipient's email address and 'message.txt' with the file containing the message.

If you want to quickly encrypt a small message you can use the following command:

```bash
echo "Here is a small secret message" | gpg --armor --enrypt --recipient recipient@example.com > message.txt
```

## 4. Decrypting an Encrypted Message

```bash
gpg --output decrypted_message.txt --decrypt encrypted_message.asc
```

- **Description**: Decrypts an encrypted message that was sent to you.
- **Details**: Replace 'encrypted_message.asc' with the file containing the encrypted message.

## 5. Encrypt/Decrypt a File

### Encrypt a File

```bash
gpg --output encrypted_file.gpg --encrypt --recipient recipient@example.com file_to_encrypt.txt
```

- **Description**: Encrypts a file using someone's public key.
- **Details**: Replace 'recipient@example.com' with the recipient's email address and 'file_to_encrypt.txt' with the file you want to encrypt.

### Decrypt a File

```bash
gpg --output decrypted_file.txt --decrypt encrypted_file.gpg
```

- **Description**: Decrypts an encrypted file using your private key.
- **Details**: Replace 'encrypted_file.gpg' with the file containing the encrypted data.

## 6. Saving Own Private Key Securely

```bash
gpg --armor --output private_key.asc --export-secret-keys your.email@example.com
```

- **Description**: Exports your private key to a file for backup purposes.
- **Details**: Replace 'your.email@example.com' with your actual email address.

## 7. Importing Private Key on New Device

```bash
gpg --import private_key.asc
```

- **Description**: Imports your private key on a new device.
- **Details**: Replace 'private_key.asc' with the actual file containing your private key.

- **Description**: Generates a new GPG key pair.
- **Details**: Prompts you to enter your name, email address, and a passphrase for the key.

## 2. Importing Own Public Key

```bash
gpg --import your_public_key.asc
```

- **Description**: Imports your public key into your GPG keyring.
- **Note**: Replace 'your_public_key.asc' with the actual file containing your public key.

## 3. Encrypting a Message Using Someone's Public Key

```bash
gpg --armor --output encrypted_message.asc --encrypt --recipient recipient@example.com message.txt
```

- **Description**: Encrypts a message using the recipient's public key.
- **Details**: Replace 'recipient@example.com' with the recipient's email address and 'message.txt' with the file containing the message.

## 4. Decrypting an Encrypted Message

```bash
gpg --output decrypted_message.txt --decrypt encrypted_message.asc
```

- **Description**: Decrypts an encrypted message that was sent to you.
- **Details**: Replace 'encrypted_message.asc' with the file containing the encrypted message.

## 5. Encrypt/Decrypt a File

### Encrypt a File

```bash
gpg --output encrypted_file.gpg --encrypt --recipient recipient@example.com file_to_encrypt.txt
```

- **Description**: Encrypts a file using someone's public key.
- **Details**: Replace 'recipient@example.com' with the recipient's email address and 'file_to_encrypt.txt' with the file you want to encrypt.

### Decrypt a File

```bash
gpg --output decrypted_file.txt --decrypt encrypted_file.gpg
```

- **Description**: Decrypts an encrypted file using your private key.
- **Details**: Replace 'encrypted_file.gpg' with the file containing the encrypted data.

## 6. Saving Own Private Key Securely

```bash
gpg --armor --output private_key.asc --export-secret-keys your.email@example.com
```

- **Description**: Exports your private key to a file for backup purposes.
- **Details**: Replace 'your.email@example.com' with your actual email address.

## 7. Importing Private Key on New Device

```bash
gpg --import private_key.asc
```

- **Description**: Imports your private key on a new device.
- **Details**: Replace 'private_key.asc' with the actual file containing your private key.

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

- Description: Signs a message using your private key.
- Details: Replace 'message.txt' with the file containing the message you want to sign. The output file 'signed_message.asc' will contain the signed message in ASCII-armored format.

### Sign a File

```bash
gpg --output signed_file.gpg --sign file_to_sign.txt
```
- Description: Signs a file using your private key.
- Details: Replace 'file_to_sign.txt' with the file you want to sign. The output file 'signed_file.gpg' will contain the signed file.

### Verify a Signed File

```bash
gpg --verify signed_file.gpg
```
- Description: Verifies the signature of a signed file.
- Details: Replace 'signed_file.gpg' with the file containing the signed file. This command will verify if the signature is valid and display information about the signer.