
# JPetStore + Kieker Instrumentation for Trace Analysis

This project demonstrates how to instrument and analyze the original MyBatis JPetStore (`jpetstore-6`) using [Kieker Monitoring](https://kieker-monitoring.readthedocs.io/en/latest/). It follows the official [Kieker Trace Analysis Tutorial](https://kieker-monitoring.readthedocs.io/en/latest/tutorials/How-to-perform-Trace-Analysis.html) with adjustments to use the vanilla JPetStore and fix compatibility issues.

---

## ✅ Prerequisites

- Java 17+ for **building** the project
- Java 8 or 11 for **running Kieker Trace Analysis 1.14**
- Maven 3.6+
- Git
- Jetty (or any servlet container)

---

## 🛠️ Setup Steps

### 1. Clone the Vanilla MyBatis JPetStore Repo

> ⚠️ **Do not** clone the repository shown in the official tutorial:
> https://github.com/research-iobserve/jpetstore-6
> Instead, clone the original vanilla repository from MyBatis as shown below.

```bash
git clone https://github.com/mybatis/jpetstore-6.git
cd jpetstore-6
```

---

### 2. Update `pom.xml` for AspectJ and Kieker

**Replace `aspectjrt` version with:**

```xml
<dependency>
  <groupId>org.aspectj</groupId>
  <artifactId>aspectjrt</artifactId>
  <version>1.9.7</version>
</dependency>
```

**Update `aspectj-maven-plugin` section:**

```xml
<plugin>
  <groupId>org.codehaus.mojo</groupId>
  <artifactId>aspectj-maven-plugin</artifactId>
  <version>1.15.0</version>
  <configuration>
    <source>1.8</source>
    <target>1.8</target>
    <complianceLevel>1.8</complianceLevel>
    ...
  </configuration>
</plugin>
```

---

### 3. Build and Run the Instrumented Project

```bash
mvn clean install
```

Deploy the WAR using Jetty (or any compatible server) and trigger user actions to generate traces.

---

### 4. Add Kieker Trace Analysis Tool

Use **Kieker Trace Analysis version 1.14** (recommended due to fewer dependency issues).

- Download and unzip Kieker Trace Analysis 1.14.
- Paste the folder `trace-analysis-1.14/` inside the root `jpetstore-6` directory.

```bash
tree jpetstore-6-master/
├── pom.xml
├── src/
├── jpetstore-6/
│   ├── pom.xml
│   ├── src/
├── trace-analysis-1.14/
│   ├── bin/
│   └── lib/
```

> 📌 You must **switch to Java 11 or Java 8** to run the Kieker trace analysis tool.

---

## 📊 Running Trace Analysis

### Sample Commands (on UNIX-based systems)

#### Generate Assembly Component Graphs

```bash
trace-analysis-1.14/bin/trace-analysis --inputdirs account_tracelog --outputdir account_tracelog --plot-Assembly-Component-Dependency-Graph responseTimes-ns
dot account_tracelog/assemblyComponentDependencyGraph.dot -T pdf -o account_tracelog/assemblyComponentDependencyGraph.pdf
```

#### Generate Assembly Operation Graphs

```bash
trace-analysis-1.14/bin/trace-analysis --inputdirs order_tracelog --outputdir order_tracelog --plot-Assembly-Operation-Dependency-Graph responseTimes-ns
dot order_tracelog/assemblyOperationDependencyGraph.dot -T pdf -o order_tracelog/assemblyOperationDependencyGraph.pdf
```

#### Generate Deployment Operation Graphs

```bash
trace-analysis-1.14/bin/trace-analysis --inputdirs category_tracelog --outputdir category_tracelog --plot-Deployment-Operation-Dependency-Graph responseTimes-ns
dot category_tracelog/deploymentOperationDependencyGraph.dot -T pdf -o category_tracelog/deploymentOperationDependencyGraph.pdf
```

> You can replace `account_tracelog`, `order_tracelog`, or `category_tracelog` with any trace folder generated during your use case testing.

---

## ⚙️ Available Trace Analysis Options

To see all available options, run:

```bash
trace-analysis-1.14/bin/trace-analysis --help
```

Key options include:

- `--plot-Assembly-Component-Dependency-Graph`
- `--plot-Assembly-Operation-Dependency-Graph`
- `--plot-Deployment-Operation-Dependency-Graph`
- `--print-Execution-Traces`
- `--print-System-Model`
- `--include-self-loops`
- `--short-labels`

---

## 📌 Notes

- The `jpetstore-6` project does **not build** with Java 8 or 11. Use Java 17+ for building.
- Kieker Trace Analysis **requires Java 8 or 11** to run properly.
- Make sure `dot` command from [Graphviz](https://graphviz.org/) is installed to convert `.dot` files to `.pdf`.

---

## 📚 Reference

- 📖 [Kieker Official Docs](https://kieker-monitoring.readthedocs.io/en/latest/)
- 🔗 [MyBatis JPetStore GitHub](https://github.com/mybatis/jpetstore-6)
