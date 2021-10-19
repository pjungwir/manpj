Use -O (oh, not zero) to write output to a file named after the file in the URL:

  curl -O http://example.com/something

To give the SNI host for SSL negotiation:

  curl --resolve www.example.com:192.0.2.1 https://www.example.com

Or with a port:

  curl --resolve www.example.com:80:192.0.2.1 https://www.example.com
