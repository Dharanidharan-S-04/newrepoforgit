# Device key
echo "==================== Creating Device keys and export to keystore"
echo "Note: mosip-signed-Partner.crt is the certificate issued by mosip after successful onboard of device provider"
openssl genrsa -out Device.key 4096
openssl req -new -key Device.key -out DevicePublicKey.csr
openssl x509 -req -extensions usr_cert -extfile ./openssl.cnf -days 300 -in DevicePublicKey.csr -CA mosip-signed.crt -CAkey Partner.key -set_serial 05 -out signed-Device.crt
#openssl pkcs12 -export -in D:\mosdemo\CA_CERT_UTILITY\CA_CERT_UTILITY\signed-Device.crt -inkey D:\mosdemo\CA_CERT_UTILITY\CA_CERT_UTILITY\Device.key -out D:\mosdemo\CA_CERT_UTILITY\CA_CERT_UTILITY\Device.p12 -name "Device"
#openssl pkcs12 -export -in /d/mosdemo/CA_CERT_UTILITY/CA_CERT_UTILITY/signed-Device.crt -inkey /d/mosdemo/CA_CERT_UTILITY/CA_CERT_UTILITY/Device.key -out /d/mosdemo/CA_CERT_UTILITY/CA_CERT_UTILITY/Device.p12 -name "Device"

