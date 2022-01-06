# "BASIC COMMANDS"

- "mvn archetype:create"
  Start a new maven project. Use it like this:

```
mvn archetype:create -DgroupId=com.mycompany -DartifactId=my-app
```

- "mvn compile"
Build your project.

- "mvn process-resources"
Copy and filter project resources.

- "mvn test-compile"
Just compile the tests.

- "mvn test"
Compile tests and run them.

- "mvn package"
Create a jar/war/ear/whatever.

- "mvn install"
Install the package in your ~/.m2 directory.

- "mvn clean"
Delete built files.

- "mvn site"
Create a website!

- "mvn eclipse:eclipse"
Generate an eclipse descriptor.

- "mvn help:describe"
Learn a plugin's options. Use it like this:

```
mvn plugin:describe -DgroupId=org.apache.maven.plugins \\
-DartifactId=maven-compiler-plugin -Dfull=true
```

# TROUBLESHOOTING
Use the -e and -X flags to get more information.


# PROJECT LAYOUT

A maven project looks like this:

```
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
```

# LIFECYCLES
There are three lifecycles: build, clean, and site.

## BUILD LIFECYCLE

The build lifecycle has these phases:

- validate
Validate that the project is correct and all necessary information is available.

- initialize
Initializes.

- generate-sources
Generate source code.

- process-sources
Process the source code, e.g. by filtering.

- generate-resources
Generate resources that will be included in the package.

- process-resources
Process the resources, e.g. by filtering. Copy them to the destination directory.

- compile
Compile the source code.

- process-classes
Process the results of compilation, e.g. for bytecode enhancement.

- generate-test-sources
Generate test source code.

- process-test-sources
Process test source code.

- generate-test-resources
Generate test resources.

- process-test-resources
Process test resources.

- test-compile
Compile the test source code.

- test
Run the unit tests.

- package
Package the compiled classes and the resources.

- pre-integration-test
Prepare for integration tests, e.g. setup the environment.

- integration-test
Deploy the package to an integration test system and run the integration tests.

- post-integration-test
Clean up after the integration test.

- verify
Run tests to verify that the package is valid.

- install
Install the package to the local repository.

- deploy
Install the package to a shared repository.


## SITE LIFECYCLE
The site lifecycle has these phases:

- pre-site
Do any setup work necessary.

- site
Generate all the site files. Defaults to site:site.

- post-site
Do any cleanup work.

- site-deploy
Deploy the site to a web server. Defaults to site:deploy.


## CLEAN LIFECYCLE
The clean lifecycle has these phases:

- pre-clean
Get ready to clean.

- clean
Clean. Defaults to clean:clean.

- post-clean
Get ready to stop cleaning.


## DEPENDENCY SCOPES
These scopes exist for dependencies:
\" http://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html

- compile
The default scope. The dependency is needed to build the project. It will be included in all classpaths.

- test
The dependency is needed to test the project.

- provided
The dependency is needed to run the project, but the container will provide it.
These dependencies are not transitive and not packaged. They are included in the classpath only for compiling.
Not even for unit tests?

- runtime
The dependency is not needed for compilation, but it is needed for running. It is included only in the test and execution phases.
What are the "execution phases"?

- system
This is like the provided scope, but the jar is not looked up from a repository; you must supply it manually.
