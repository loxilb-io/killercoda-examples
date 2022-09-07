Now need to test and check with LoxiLB CLI.

Connect Client and request to Nginx service through LoxiLB:

```
ip netns client exec curl http://123.123.123.1:8888
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

Check conntrack status through LoxiLB CLI:
```
ubuntu $ ip netns exec loxilb loxicmd get lb
|  EXTERNAL IP  | PORT | PROTOCOL | SELECT | # OF ENDPOINTS |
|---------------|------|----------|--------|----------------|
| 123.123.123.1 | 8888 | tcp      |      0 |              1 |
ubuntu $ ip netns exec loxilb loxicmd get conntrack
| DESTINATIONIP |  SOURCEIP  | DESTINATIONPORT | SOURCEPORT | PROTOCOL |    STATE    |            ACT             | PACKETS | BYTES |
|---------------|------------|-----------------|------------|----------|-------------|----------------------------|---------|-------|
| 1.1.1.2       | 172.18.0.3 |           46100 |      30311 | tcp      | closed-wait | snat-123.123.123.1:8888:w0 |       5 |   310 |
| 123.123.123.1 | 1.1.1.2    |            8888 |      46266 | tcp      | closed-wait | dnat-172.18.0.3:30311:w0   |       6 |   348 |
| 1.1.1.2       | 172.18.0.3 |           46266 |      30311 | tcp      | closed-wait | snat-123.123.123.1:8888:w0 |       5 |   310 |
| 123.123.123.1 | 1.1.1.2    |            8888 |      46100 | tcp      | closed-wait | dnat-172.18.0.3:30311:w0   |       6 |   348 |
ubuntu $
```

Congratulation ! You had completed whole things !
