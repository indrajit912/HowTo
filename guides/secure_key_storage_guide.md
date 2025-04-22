# Securely Storing Private Keys with GPG Encryption and SHA256 Hashing

**Author:** Indrajit Ghosh 
**Created On:** Apr 22, 2025

## Purpose:
This guide describes how to securely encrypt private keys using GPG, store them with random filenames, and use SHA256 hashes to keep track of metadata securely. This is for use when storing sensitive keys (e.g., RSA, Fernet) on a USB drive.

## Steps to Encrypt and Store Private Keys:

### 1. **Encrypt the Private Key with GPG**
- Use GPG to encrypt your private key.
- Example: Encrypting `rsa_private_key.pem`

```bash
gpg -e -r YourGPGKeyID rsa_private_key.pem
```

This will create a file: `rsa_private_key.pem.gpg`.

### 2. **Rename the Encrypted Key to a Random Name**
- Rename the encrypted key file to something non-descriptive.

```bash
mv rsa_private_key.pem.gpg invoice123.pem.pgp
```

Now, your USB contains:

```
invoice123.pem.pgp
```

### 3. **Create Metadata for the Key**
- Create a text file that contains a description of the encrypted key, for example:

```bash
echo "RSA key for Server A" > note.txt
```

### 4. **Encrypt the Metadata File with GPG**
- Encrypt the metadata file to keep it secure.

```bash
gpg -e -r YourGPGKeyID note.txt
```

This will create: `note.txt.gpg`.

### 5. **Generate a SHA256 Hash for the Filename**
- Use the `sha256sum` command to generate a SHA256 hash of the original filename.

```bash
echo -n "invoice123.pem.pgp" | sha256sum
```

Example output:

```
2c93594adcc812e961fe56a93f87f6aed9a8c170eb4f45f3d8eec4ee3f0547362c93594abbf1a02c0b6ffccf9d9489e93cb3bfc799ac13f8c157f234e3c52db0
```

- Use the first 8 characters of the hash as the name for the metadata file:

```bash
mv note.txt.gpg 2c93594a.meta.gpg
```

Now, your USB contains:

```
invoice123.pem.pgp       # Encrypted key
2c93594a.meta.gpg        # Encrypted metadata (description)
```

### 6. **Decryption Process**
To decrypt the files later:
1. Use `gpg` to decrypt the metadata file:

```bash
gpg -d 2c93594a.meta.gpg
```

2. The decrypted metadata will reveal that `invoice123.pem.pgp` contains the RSA key for Server A.

---

## Additional Notes:
- **Index File (Optional):** If you want to keep a record of multiple encrypted keys, you can create an `index.txt` with filenames and descriptions, then encrypt it with GPG.
- **Avoid Using Plain Text:** Always encrypt both the keys and any metadata.
- **Cold Storage:** Keep the USB drive in a safe, offline location.

---

## Example Directory Structure on USB:

```
/encrypted_keys/
  invoice123.pem.pgp
  2c93594a.meta.gpg
```

This structure ensures both the private keys and their descriptions are securely stored.

---



