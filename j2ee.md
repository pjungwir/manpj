LOGGING

One good reason to set the logging level to debug is to see the generated SQL. This can help you find errors in your xdoclet tags when you're getting exceptions from the database. But be warned: this generates tons of information, particularly on deploys when JBoss parses XML files.

To tweak logging, you must edit two files. The first is $JBOSS_HOME/server/default/conf/standardjaws.xml. Make sure you have this line:

	<debug>true</debug>

That will cause JBoss to output debugging information. But you must also tell Log4J to print it. Set the logging threshold in $JBOSS_HOME/server/default/conf/log4j.xml. You want a line like this:

	<param name="Threshold" value="DEBUG"/>

Note that the console and logfile are controlled separately.



EJBQL

You can write finders that mimic CMRs but don't cause locking. Suppose you have a one-to-many relationship between Person and Shoe. To find a Person's Shoes, you'd write this:

ShoeEJB.findByPersonName(String personName):
	SELECT Object(s) FROM Shoe s
	WHERE s.owner.personName = ?1

This assumes that Shoe has a getOwner method returning a Person and Person has a getPersonName method returning a String.

To find the Person who owns a Shoe, write this:

PersonEJB.findByShoeID(String shoeID):
	SELECT Object(p) FROM Person p, IN(p.shoe) s
	WHERE s.shoeID = ?1

Note that, unlike these two examples, you don't need to use the primary key in
your WHERE clause. Suppose you want all the shoes owned by people with red hair. You could write this:

ShoeEJB.findByPersonHair(String hairColor):
	SELECT Object(s) FROM Shoe s
	WHERE s.owner.hairColor = ?1

Or you could get all the people with shoes over 5 years old:

PersonEJB.findByShoeAge(Integer shoeAge):
	SELECT Object(p) FROM Person p, IN(p.shoe) s
	WHERE s.shoeAge = ?1


