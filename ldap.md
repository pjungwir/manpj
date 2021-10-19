To run it:

    ldapsearch -h ldap.example.com <query>

more useful options:

    -x    no SASL (e.g. if you get an error about "No credentials cache file found")

complete examples:

    ldapsearch -H ldap://ldap.example.com -x -b 'ou=people,dc=example,dc=com'
    ldapsearch -H ldap://ldap.example.com -x -b 'ou=people,dc=example,dc=com' '(uid=jungwirthp)'
    # binding as the user:
    ldapsearch -H ldap://ldap.example.com -x -D 'cn=jungwirthp,ou=People,dc=example,dc=org' -w CENSORED -b 'ou=people,dc=example,dc=org' '(uid=jungwirthp)'
