etsasia-inspec-linux-baseline

The purpose of this project to develop a Linux basline testing profile for InSpec automated testing.
It targets to run a series of testcases on Linux to make sure it meet all the security, operational and performance requirements.

## Usage
To run the Linux basline test locally
```
git clone https://github.com/kokeisd/inspec-linux-baseline.git
sudo inspec exec inspec-linux-baseline 
```

To run the Linux basline remotely
```
git clone https://github.com/kokeisd/inspec-linux-baseline.git
inspec exec inspec-linux-baseline --user=<username> --password='<password>' -t ssh://<hostname> --sudo-password='<password>' --sudo

```
Or directly execute with the stable build
```
inspec exec https://github.com/kokeisd/inspec-linux-baseline/raw/master/build/inspec-linux-baseline-0.1.0.tar.gz --user=<username> --password='<password>' -t ssh://<hostname> --sudo-password='<password>' --sudo
```
