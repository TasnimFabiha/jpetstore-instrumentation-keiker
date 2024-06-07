**jpetstore-master from Mybatis - Kieker Instrumentation**

# Follow the tutorial https://kieker-monitoring.readthedocs.io/en/latest/tutorials/How-to-perform-Trace-Analysis.html

# But instead of taking the following repo demonstrated in the tutorial,
https://github.com/research-iobserve/jpetstore-6
Take the original vanilla jpetstore master repo from here:
https://github.com/mybatis/jpetstore-6

# This project won't build if java version is lower than java 17 (doen't build with java 8/11)

# While injecting the dependencies in pom.xml change the following line accordingly:
    <dependency>
        <groupId>org.aspectj</groupId>
        <artifactId>aspectjrt</artifactId>
        <version>1.8.7</version>
    </dependency>

	Change the aspects version to **1.9.7**
	
    <dependency>
      <groupId>org.aspectj</groupId>
      <artifactId>aspectjrt</artifactId>
      <version>1.9.7</version>
    </dependency>


    And in the plugin section change to the following bold text

    <plugin>
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>aspectj-maven-plugin</artifactId>
        <version>**1.15.0**</version>
        <configuration>
          <source>**1.8**</source>
          <target>**1.8**</target>
          <complianceLevel>**1.8**</complianceLevel>

# After setting up everything and hosting the project on jetty as described in the tutorial, keiker trace analysis tool need to be pasted on the project directory (same directory where jpetstore-6 is loaded) 

# Use keiker trace analysis 1.14 (the latest 1.15.4 has a lot of dependency issue). Paste the trace-analysis-1.14 folder (that has lib and bin folders) on the same jpetstore-6 project directory

# To use the trace analysis 1.14 version java version must be java 8 or java 11 (downgrade to jdk11, previously I had jdk21/jdk17, I had to downgrade it to jdk11)



# Get trace command UNIX machine
# - Assembly

$ trace-analysis-1.14/bin/trace-analysis --inputdirs account_tracelog --outputdir account_tracelog --plot-Assembly-Component-Dependency-Graph responseTimes-ns
$ dot account_tracelog/assemblyComponentDependencyGraph.dot -T pdf -o account_tracelog/assemblyComponentDependencyGraph.pdf

$ trace-analysis-1.14/bin/trace-analysis --inputdirs order_tracelog --outputdir order_tracelog --plot-Assembly-Component-Dependency-Graph responseTimes-ns
$ dot order_tracelog/assemblyComponentDependencyGraph.dot -T pdf -o order_tracelog/assemblyComponentDependencyGraph.pdf

$ trace-analysis-1.14/bin/trace-analysis --inputdirs category_tracelog --outputdir category_tracelog --plot-Assembly-Component-Dependency-Graph responseTimes-ns
$ dot category_tracelog/assemblyComponentDependencyGraph.dot -T pdf -o category_tracelog/assemblyComponentDependencyGraph.pdf

$ trace-analysis-1.14/bin/trace-analysis --inputdirs account_tracelog --outputdir account_tracelog --plot-Assembly-Operation-Dependency-Graph responseTimes-ns
$ dot account_tracelog/assemblyOperationDependencyGraph.dot -T pdf -o account_tracelog/assemblyOperationDependencyGraph.pdf

$ trace-analysis-1.14/bin/trace-analysis --inputdirs order_tracelog --outputdir order_tracelog --plot-Assembly-Operation-Dependency-Graph responseTimes-ns
$ dot order_tracelog/assemblyOperationDependencyGraph.dot -T pdf -o order_tracelog/assemblyOperationDependencyGraph.pdf

$ trace-analysis-1.14/bin/trace-analysis --inputdirs category_tracelog --outputdir category_tracelog --plot-Assembly-Operation-Dependency-Graph responseTimes-ns
$dot category_tracelog/assemblyOperationDependencyGraph.dot -T pdf -o category_tracelog/assemblyOperationDependencyGraph.pdf


# - Deployment

$ trace-analysis-1.14/bin/trace-analysis --inputdirs account_tracelog --outputdir account_tracelog --plot-Deployment-Operation-Dependency-Graph responseTimes-ns
$ dot account_tracelog/deploymentOperationDependencyGraph.dot -T pdf -o account_tracelog/deploymentOperationDependencyGraph.pdf

$ trace-analysis-1.14/bin/trace-analysis --inputdirs order_tracelog --outputdir order_tracelog --plot-Deployment-Operation-Dependency-Graph responseTimes-ns
$ dot order_tracelog/deploymentOperationDependencyGraph.dot -T pdf -o order_tracelog/deploymentOperationDependencyGraph.pdf

$ trace-analysis-1.14/bin/trace-analysis --inputdirs category_tracelog --outputdir category_tracelog --plot-Deployment-Operation-Dependency-Graph responseTimes-ns
$dot category_tracelog/deploymentOperationDependencyGraph.dot -T pdf -o category_tracelog/deploymentOperationDependencyGraph.pdf



# Here are all the options that can be given as argument for running the trace analysis tool
Usage: <main class> [options]
  Options:
    --addDescriptions
      Adds descriptions to elements according to the given file as a 
      properties file (key: component ID, e.g., @1; value: description)
    -d, --debug
      prints additional debug information
      Default: false
    --filter-traces
      Consider only the traces not identified by the list of trace IDs. 
      Defaults to no traces.
    -h, --help
      prints the usage information for the tool, including available options
    --ignore-assumed-calls
      If selected, assumed calls are visualized just as regular calls.
      Default: false
    --ignore-executions-after-date
      Executions ending after this date (UTC timezone) or monitoring timestamp 
       are ignored.
    --ignore-executions-before-date
      Executions starting before this date (UTC timezone) or monitoring 
      timestamp are ignored.
    --ignore-invalid-traces
      If selected, the execution aborts on the occurence of an invalid trace.
      Default: false
    --include-self-loops
      If selected, self-loops are included in the visualizations.
      Default: false
    -i, --inputdirs
      Log directories to read data from
    --max-trace-duration
      Threshold (in ms) after which incomplete traces become invalid. Defaults 
      to 600,000 (i.e, 10 minutes).
    -p, --output-filename-prefix
      Prefix for output filenames
  * -o, --outputdir
      Directory for the generated file(s)
    --plot-Aggregated-Assembly-Call-Tree
      Generate and store an aggregated assembly-level call tree (.dot)
      Default: false
    --plot-Aggregated-Deployment-Call-Tree
      Generate and store an aggregated deployment-level call tree (.dot)
      Default: false
    --plot-Assembly-Component-Dependency-Graph
      Generate and store an assembly-level component dependency graph (.dot)
    --plot-Assembly-Operation-Dependency-Graph
      Generate and store an assembly-level operation dependency graph (.dot)
    --plot-Assembly-Sequence-Diagrams
      Generate and store assembly-level sequence diagrams (.pic)
      Default: false
    --plot-Call-Trees
      Generate and store call trees for the selected traces (.dot)
      Default: false
    --plot-Container-Dependency-Graph
      Generate and store a container dependency graph (.dot file)
      Default: false
    --plot-Deployment-Component-Dependency-Graph
      Generate and store a deployment-level component dependency graph (.dot)
    --plot-Deployment-Operation-Dependency-Graph
      Generate and store a deployment-level operation dependency graph (.dot)
    --plot-Deployment-Sequence-Diagrams
      Generate and store deployment-level sequence diagrams (.pic)
      Default: false
    --print-Assembly-Equivalence-Classes
      Output an overview about the assembly-level trace equivalence classes
      Default: false
    --print-Deployment-Equivalence-Classes
      Output an overview about the deployment-level trace equivalence classes
      Default: false
    --print-Execution-Traces
      Save execution trace representations of valid traces (.txt)
      Default: false
    --print-Message-Traces
      Save message trace representations of valid traces (.txt)
      Default: false
    --print-System-Model
      Save a representation of the internal system model (.html)
      Default: false
    --print-invalid-Execution-Traces
      Save a execution trace representations of invalid trace artifacts (.txt)
      Default: false
    --repair-event-based-traces
      If selected, BeforeEvents with missing AfterEvents e.g. because of 
      software crash will be repaired.
      Default: false
    --select-traces
      Consider only the traces identified by the list of trace IDs. Defaults 
      to all traces.
    --short-labels
      If selected, abbreviated labels (e.g., package names) are used in the 
      visualizations. 
      Default: false
    --traceColoring
      Color traces according to the given color map given as a properties file 
      (key: trace ID, value: color in hex format, e.g., 0xff0000 for red; use 
      trace ID 'default' to specify the default color)
    -v, --verbose
      verbosely prints additional information
      Default: false