HELO here.com
MAIL FROM:foo@here.com
RCPT TO:bar@there.com
STARTTLS
AUTH PLAIN dGVzdAB0ZXN0ADEyMzQ=
DATA
greetings!
\.

Where `AUTH PLAIN` is the base64 of the

openssl s_client -starttls smtp -crlf -connect mail.example.com:587
openssl s_client -debug -starttls smtp -crlf -connect mail.example.com:587

