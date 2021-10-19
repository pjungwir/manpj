httrack is a great program for grabbing a local copy of whole websites.

To grab a whole domain, including photos and other files, and non-html files from other domains, do this:

httrack -n www.example.com '+www.example.com/*'

The -n gets non-html files.
The filter at the end says the get all files located at the domain.

Here is a real life example:

httrack -n evlogia.typepad.com/evlogia/ '+evlogia.typepad.com/*'

You can use -rN to limit the depth to N links. To get a single page and its media, do something like this:

httrack http://thesurvivalistblog.blogspot.com/2009/06/survival-101.html -n '+thesurvivalistblog.blogspot.com/*' -r1

To get all the pages linked off that page (as if it were a table of contents), just use -r2:

httrack http://thesurvivalistblog.blogspot.com/2009/06/survival-101.html -n '+thesurvivalistblog.blogspot.com/*' -r2

If you're copying a blogspot blog, you probably need some more filters:
	'-www.blogger.com/delete-comment.g*'  '-www.blogger.com/navbar.g*'


