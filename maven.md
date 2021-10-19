.\" Notes on maven
.TH maven pj "28 September 2006"
.SH NAME
maven
.SH "BASIC COMMANDS"
.TP
.B "mvn archetype:create"
Start a new maven project. Use it like this:
.PP
.RS
mvn archetype:create -DgroupId=com.mycompany -DartifactId=my-app
.RE
.PP
.TP
.B "mvn compile"
Build your project.
.TP
.B "mvn process-resources"
Copy and filter project resources.
.TP
.B "mvn test-compile"
Just compile the tests.
.TP
.B "mvn test"
Compile tests and run them.
.TP
.B "mvn package"
Create a jar/war/ear/whatever.
.TP
.B "mvn install"
Install the package in your ~/.m2 directory.
.TP
.B "mvn clean"
Delete built files.
.TP
.B "mvn site"
Create a website!
.TP
.B "mvn eclipse:eclipse"
Generate an eclipse descriptor.
.TP
.B "mvn help:describe"
Learn a plugin's options. Use it like this:
.PP
.RS
.nf
mvn plugin:describe -DgroupId=org.apache.maven.plugins \\
-DartifactId=maven-compiler-plugin -Dfull=true
.fi
.RE
.PP

.SH TROUBLESHOOTING
Use the -e and -X flags to get more information.


.SH "PROJECT LAYOUT"
A maven project looks like this:
.PP
.RS
.nf
pom.xml
src/main/java
src/main/resources
src/main/filters
src/main/assembly
src/main/config
src/main/scripts
src/test/java
src/test/resources
src/test/filters
src/site
LICENSE.txt
README.txt
target
.fi
.RE
.PP
.SH "LIFECYCLES"
There are three lifecycles: build, clean, and site.

.SH "BUILD LIFECYCLE"
The build lifecycle has these phases:
.PP
.TP
.B validate
Validate that the project is correct and all necessary information is available.
.TP
.B initialize
Initializes.
.TP
.B generate-sources
Generate source code.
.TP
.B process-sources
Process the source code, e.g. by filtering.
.TP
.B generate-resources
Generate resources that will be included in the package.
.TP
.B process-resources
Process the resources, e.g. by filtering. Copy them to the destination directory.
.TP
.B compile
Compile the source code.
.TP
.B process-classes
Process the results of compilation, e.g. for bytecode enhancement.
.TP
.B generate-test-sources
Generate test source code.
.TP
.B process-test-sources
Process test source code.
.TP
.B generate-test-resources
Generate test resources.
.TP
.B process-test-resources
Process test resources.
.TP
.B test-compile
Compile the test source code.
.TP
.B test
Run the unit tests.
.TP
.B package
Package the compiled classes and the resources.
.TP
.B pre-integration-test
Prepare for integration tests, e.g. setup the environment.
.TP
.B integration-test
Deploy the package to an integration test system and run the integration tests.
.TP
.B post-integration-test
Clean up after the integration test.
.TP
.B verify
Run tests to verify that the package is valid.
.TP
.B install
Install the package to the local repository.
.TP
.B deploy
Install the package to a shared repository.


.SH "SITE LIFECYCLE"
The site lifecycle has these phases:
.TP
.B pre-site
Do any setup work necessary.
.TP
.B site
Generate all the site files. Defaults to site:site.
.TP
.B post-site
Do any cleanup work.
.TP
.B site-deploy
Deploy the site to a web server. Defaults to site:deploy.


.SH "CLEAN LIFECYCLE"
The clean lifecycle has these phases:
.TP
.B pre-clean
Get ready to clean.
.TP
.B clean
Clean. Defaults to clean:clean.
.TP
.B post-clean
Get ready to stop cleaning.


.SH "DEPENDENCY SCOPES"
These scopes exist for dependencies:
\" http://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html
.PP
.TP
.B compile
The default scope. The dependency is needed to build the project. It will be included in all classpaths.
.TP
.B test
The dependency is needed to test the project.
.TP
.B provided
The dependency is needed to run the project, but the container will provide it.
These dependencies are not transitive and not packaged. They are included in the classpath only for compiling.
Not even for unit tests?
.TP
.B runtime
The dependency is not needed for compilation, but it is needed for running. It is included only in the test and execution phases.
What are the "execution phases"?
.TP
.B system
This is like the provided scope, but the jar is not looked up from a repository; you must supply it manually.

.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth


