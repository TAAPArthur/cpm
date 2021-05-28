# cpm
ccrypt-based password manager

cpm is a tiny shell script which is heavily inspired and largely
compatible with tpm which itself was inspired by pass. Unlike tpm,
cpm uses ccrypt instead of gpg2 to securely store your passwords.
Like tpm, it is entirly written in POSIX shell.

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

Unlike gpg2, a password has to be provided every invocation. If this is an inconvenience,
`cpm unlock` can be used. This prompts for a password and writes said password
to a ${PASSWORD_CACHE_FILE:-/tmp/.cpm/$USER/default} where it will be used for future
decryption. While the file is only readable by you and by default won't persist
across a reboot, it is still stored in plain text. It can be removed with `cpm
lock`
