## INTRO

HTTP/1.0 is defined in RFC ????.

HTTP/1.1 is defined in RFC 2616.

A GET looks like this:

...

A POST looks like this:

```
POST /api/integrate.asp HTTP/1.1
Connection: close
Host: localhost:8090
User-Agent: libwww-perl/5.65
Content-Type: application/x-www-form-urlencoded
Content-Length: 177

qf=xml&xml=%3C%3Fxml%20version%3D%221%2E0%22%3F%3E%0A%3Csystem%3E%0A%09%3Csystem_name%3Ediagnostics%3C%2Fsystem_name%3E%0A%09%3Caction%3EPing%3C%2Faction%3E%0A%3C%2Fsystem%3E%0A
```

or like this:

```
POST /api/integrate.asp HTTP/1.1
content-type: text/xml; charset="utf-8"
User-Agent: Java/1.5.0_01
Host: localhost:8090
Accept: text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2
Connection: keep-alive
Content-Length: 104

<?xml version="1.0"?>
<system>
        <system_name>diagnostics</system_name>
        <action>Ping</action>
</system>
```

## HEADERS

- Content-Type:
The default Content-Type for form submissions is "application/x-www-form-urlencoded." This is the encoding you often see on URLs, with name=value pairs separated by &s, in which a space becomes + and other characters become %nn. It is used for POSTs, too. But if a submission includes a file upload, the Content-Type must be "multipart/form-data."

- Connection:
In HTTP/1.1, connections are persistent by default. This is so a browser can request images and whatnot without having to open 20 connections; it just reuses the same connection for all the requests. But if either the client or server issues a Connection header of "close," then that request is the last exchange. By convention, though not part of RFC 2616, user agents indicate a persistent connection with a value of "keep-alive."

- Content-Length:
This field indicates the length in bytes of the message.
A Content-Length is required for persistent connections unless you're using a "chunked" Transfer-Encoding (see below), in which case the Content-Length is ignored.
It is also required for clients contacting HTTP/1.0 servers.
The length given must be the size of the message after any encoding.

- Accept-Encoding:
This field indicates which encodings an agent can accept. The value "identity" means no transformation is required. Other values include "gzip" (gnu zip), "compress" (unix compress), and "deflate" (zlib).

- Content-Encoding:
This field indicates how an entity is encoded. It is primarily used to compress the object before sending it. Agents should not send this header at all if the Content-Encoding is "identity."

- Transfer-Encoding:
Whereas Content-Encoding indicates the encoding of the entity, this field indicates the encoding of the message. RFC 2616 insists on this distinction between entity and message, but it seems to me dubious at best. Anyway, this header supports one additional value: "chunked." Chunked messages do not have a Content-Length field, but each chunk indicates its length as part of the message body.
Each chunk begins with its size in hex, a CRLF, and the chunk data. The last chunk has a size of 0.
