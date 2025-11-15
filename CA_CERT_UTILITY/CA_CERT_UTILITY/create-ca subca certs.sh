# warning: do not use the certificates produced by this tool in production. This is for testing purposes only

# certificate authority
echo "==================== Creating CA certificate"
openssl genrsa -out RootCA.key 4096
openssl req -new -x509 -days 1826 -extensions v3_ca -key RootCA.key -out RootCA.crt


# intermediate CA
echo "==================== Creating Intermediate CA certificate"
openssl genrsa -out IntermediateCA.key 4096
openssl req -new -key IntermediateCA.key -out IntermediateCA.csr
openssl x509 -req -days 1000 -extfile ./openssl.cnf -extensions v3_intermediate_ca -in IntermediateCA.csr -CA RootCA.crt -CAkey RootCA.key -out IntermediateCA.crt -set_serial 01
openssl verify -CAfile RootCA.crt IntermediateCA.crt