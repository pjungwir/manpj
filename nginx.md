To get an illuminatedcomputing.com nginx access log into CSV format, you can do this:

```
apache_log_parser -p '%h %{iso}t "%r" %>s %b "%{Referer}i" "%v" "%{User-Agent}i" "%{forwarded_for}t" %T' /var/log/nginx/ic-access.log | vd -f csv
```

To get the cli command (and various fixes), you have to [my git repo](https://github.com/pjungwir/apache-log-parser/) and not upstream.
Just say:

```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python setup.py install
```
