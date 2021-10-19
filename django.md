To debug a missing template error:

    python ./manage.py shell
    from django.conf import settings; print settings.TEMPLATE_DIRS[0]
    from django.template import loader; print loader.get_template('foo.html')
