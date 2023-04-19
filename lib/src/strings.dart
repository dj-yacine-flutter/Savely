import 'dart:convert';

/// The [host] variable holds the decoded value of the base64-encoded URL of the server where the API is hosted.
final host = utf8.decode(base64.decode('aHR0cHM6Ly9zYXZlLWZyb20ubmV0'));

/// The [api] variable holds the decoded value of the base64-encoded URL of the covert endpoint.
final api =
    utf8.decode(base64.decode('aHR0cHM6Ly9zYXZlLWZyb20ubmV0L2FwaS9jb252ZXJ0'));

/// The [referer] variable holds the decoded value of the base64-encoded URL of the referer header.
final referer =
    utf8.decode(base64.decode('aHR0cHM6Ly9zYXZlLWZyb20ubmV0L2VuMS8='));

/// The [authority] variable holds the decoded value of the base64-encoded URL of the authority header.
final authority = utf8.decode(base64.decode('c2F2ZS1mcm9tLm5ldA=='));

/// The [userAgent] variable holds the user agent string sent with the HTTP request headers. It identifies the browser and operating system used to make the request.
const userAgent =
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36';

/// The [secChUa] variable holds the security-challenge-ua string sent with the HTTP request headers. It's a security feature to prevent bots from making requests to the server.
const secChUa =
    '"Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"';
