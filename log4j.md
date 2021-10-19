$Id: log4j,v 1.2 2004/04/28 20:23:24 pjungwir Exp $
$Revision: 1.2 $
$Date: 2004/04/28 20:23:24 $
$Author: pjungwir $

This document describes how to do logging in ecom/sync/kaiser and how to configure jboss to get a separate log file for each project/developer (really, for each ear file). It also has a quick log4j overview.




Log4j Overview
==============

What follows is a whirlwind tour. If you know nothing about log4j, read this short introduction first:

http://logging.apache.org/log4j/docs/manual.html

So log4j has Loggers, Appenders, and Patterns. Loggers were historically also called Categories. All log methods are called off a Logger. You get your Logger like this:

Logger log = Logger.getLogger("myLogger");

Now, each logger has a Level, such as DEBUG, INFO, WARN, etc. You write messages using methods like this:

log.info("hi mom");
log.debug("at line 9");
log.warn("uh oh");

The Logger drops any messages below its Level. The Level is set in the log4j.xml file like this:

<category name="myLogger">
    <priority value="INFO">
</category>

If you haven't set up your specific logger, it inherits its Level from its parent. The logger heirarchy works with dots, like the java package structure, so the parent of the Logger named "kaiser.web.user" is "kaiser.web." At the very top is the root logger. The root logger by default has a level of DEBUG. So the immediate parent of "myLogger" is the root logger.

Each Logger makes an immediate decision, based on its Level, whether to drop your message or forward it to its list of Appenders. Each Appender is defined in the log4j.xml like this:

<appender name="CONSOLE" class="org.apache.log4j.ConsoleAppender">
    <param name="Target" value="System.out"/>
    <param name="Threshold" value="INFO"/>

    <layout class="org.apache.log4j.PatternLayout">
      <!-- The default pattern: Date Priority [Category] Message\n -->
      <param name="ConversionPattern" value="%d{ABSOLUTE} %-5p [%c{1}] %m%n"/>
    </layout>
</appender>

As you can see, the Appender specifies a destination (here "System.out") and a Pattern. If you want to learn more about Patterns, look for some online documentation. Basically, they just make your message pretty. An Appender may also have a Threshold. This is another place to drop or retain log messages. Appenders drop everything below their Threshold.




Logging Best Practices
======================

For the most fine-grained control over your logging, name each Logger based on its class. That lets you tweak the logging level on a class-by-class or package-by-package basis, which is really nice. For instance, you could have:

<category name="com.banta_im">
    <priority value="INFO">
</category>

<category name="com.banta_im.kaiser.server.user.UserManager">
    <priority value="DEBUG">
</category>

Then your Appender gets DEBUG messages from within UserManager and INFO messages from everywhere else.

The easiest way to do this in code is like this:

public class MyClass {

    static final Logger log = Logger.getLogger(MyClass.class);

}

As you can see, Logger.getLogger can also take a Class object. This is equivalent to Logger.getLogger(MyClass.class.getName()). This is a lot better than Logger.getLogger("com.banta_im.kaiser.server.user.UserManager"), because it's shorter and not prone to typos.

Also note that the log object is static, so you can use it everywhere in your class by just saying "log." Log4j is already thread-safe, so you don't need to synchronize this object.




A Log of Your Own
=================

One really nice thing in j2ee development is to have a separate log file for each developer. If you're deploying in an ear file, here's how to do it in JBoss:

First, create an Appender for each log file, like this:

<appender name="Kaiser-pjungwir" class="org.apache.log4j.FileAppender">
    <!--
    <errorHandler class="org.jboss.logging.util.OnlyOnceErrorHandler"/>
    -->
    <param name="Append" value="false"/>
    <param name="File" value="${jboss.server.home.dir}/log/Kaiser-pjungwir.log"/>
    <param name="Threshold" value="DEBUG"/>
    <layout class="org.apache.log4j.PatternLayout">
        <param name="ConversionPattern" value="%d{ABSOLUTE} %-5p [%c{1}] %m%n"/>
    </layout>
    <filter class="org.jboss.logging.filter.TCLFilter">
        <param name="AcceptOnMatch" value="true"/>
        <param name="DeployURL" value="Kaiser-pjungwir.ear"/>
    </filter>
</appender>

Next, add that appender to the root logger:

<root>
    <priority value="INFO"/>
    <appender-ref ref="CONSOLE"/>
    <appender-ref ref="Kaiser-pjungwir"/>
    <appender-ref ref="Kaiser-another"/>
    <appender-ref ref="FILE"/>
</root>

So easy! If you're running JBoss 3.2.3 instead of JBoss 3.2.4, you don't have the TCLFilter class. But you can get the source here:

http://jboss.org/wiki/attach?page=Logging%2FJDK14LoggerPlugin.java

This is easy to build and jar. Then just drop it in /local/java/jboss/server/default/lib. It doesn't seem to work in /local/java/jboss/lib.

Note that above, the root logger's Level was set to INFO. If you then set the "com.banta_im" Logger's Level to DEBUG, you hide other company's debug messages and see only your own. This is a lot easier than trying to hide the debug messages of every piece of third-party software in the app server.

