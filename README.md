# cpm
ccrypt-based password manager

cpm is a tiny shell script which is heavily inspired and largely
compatible with tpm which itself was inspired by pass. Unlike tpm,
cpm uses ccrypt instead of gpg2 to securely store your passwords.
Like tpm, it is entirely written in POSIX shell.

## Install
```
make install
```

## Usage
To view passwords with name A
```
cpm show A
```
You will be prompted decryption password.
To store passwords with name A
```
cpm insert A
```
You will be prompted for an encryption password twice.
The data will also be read from stdin

For convenience, [keyctl](https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git) will automatically be used if it is installed and writable to remember saved passwords. Alternatively the `unlock` and `lock` will write the given password to a 600 file in /tmp and use that as the default password.

## Example workflows:
Suppose you have a password `P` stored with key `K` that is encrypted with `MASTER`. You sync the encrypted file to some other device like a phone. While you want the file contents on both devices to be the same, you want to access the file on your 2nd device with a different password `GRAND_MASTER` (say from the output of a fingerprint reader)
```
# Encypt MASTER with the output of finger_printer_reader and store it
$ printf "%s\n%s" GRAND_MASTER MASTER | cpm insert master
# Use the finger print reader to get the master password and store that in a keyring (or file with `unlock`)
$ printf GRAND_MASTER | cpm show master | cpm kunlock
# Access K without prompt
$ cpm show K
P
```
