### Root Certificate

# Install openssl
sudo apt install openssl ca-certificates

mkdir certs

# Generate root ca private key
openssl genrsa -des3 -out ca.key 4096

# Generate root certificate
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem

### Signed certificates
openssl genrsa -out domain.com.key 4096

openssl req -new -key domain.com.key -out domain.com.csr

# Generate X509 extension config

```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = domain.com
```

# Generate certificate
openssl x509 -req -in domain.com.csr -CA ca.pem -CAkey ca.key \
    -CAcreateserial -out domain.com.crt -days 825 -sha256 -extfile domain.com.ext


