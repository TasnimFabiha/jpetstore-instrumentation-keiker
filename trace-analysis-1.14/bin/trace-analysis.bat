@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  trace-analysis startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and TRACE_ANALYSIS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\trace-analysis-1.14.jar;%APP_HOME%\lib\kieker-tools-1.14.jar;%APP_HOME%\lib\jgraphx-2.1.1.0.jar;%APP_HOME%\lib\Rsession-2012-09-04.r114.jar;%APP_HOME%\lib\Rserve-0.6-1.jar;%APP_HOME%\lib\REngine-0.6-1.jar;%APP_HOME%\lib\reflections-0.9.9-RC1.jar;%APP_HOME%\lib\activemq-core-5.7.0.jar;%APP_HOME%\lib\jetty-servlets-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-xml-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-jndi-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-plus-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-http-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-nosql-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-util-ajax-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-rewrite-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-client-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-memcached-sessions-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-schemas-3.1.jar;%APP_HOME%\lib\jetty-io-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-continuation-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-security-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-annotations-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-jmx-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-alpn-conscrypt-server-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-alpn-server-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-server-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-deploy-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-gcloud-session-manager-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-quickstart-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-alpn-openjdk8-server-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-jaas-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-alpn-java-server-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-openid-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-unixsocket-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-proxy-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-webapp-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-util-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-jaspi-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-cdi-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-hazelcast-9.4.28.v20200408.jar;%APP_HOME%\lib\jetty-servlet-9.4.28.v20200408.jar;%APP_HOME%\lib\kieker-analysis-1.14.jar;%APP_HOME%\lib\javax.jms-1.1.jar;%APP_HOME%\lib\org.eclipse.emf.common_2.10.0.v20140514-1158.jar;%APP_HOME%\lib\org.eclipse.emf.ecore.xmi_2.10.0.v20140514-1158.jar;%APP_HOME%\lib\org.eclipse.emf.ecore_2.10.0.v20140514-1158.jar;%APP_HOME%\lib\kieker-monitoring-1.14.jar;%APP_HOME%\lib\disl-server.jar;%APP_HOME%\lib\sigar-1.6.4.jar;%APP_HOME%\lib\jsr311-api-1.1.1.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.1.jar;%APP_HOME%\lib\jersey-server-1.19.jar;%APP_HOME%\lib\jersey-client-1.19.jar;%APP_HOME%\lib\jersey-apache-client4-1.19.jar;%APP_HOME%\lib\javax.servlet-3.0.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\spring-beans-3.2.8.RELEASE.jar;%APP_HOME%\lib\spring-context-3.2.8.RELEASE.jar;%APP_HOME%\lib\spring-core-3.2.8.RELEASE.jar;%APP_HOME%\lib\spring-web-3.2.8.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-portlet-3.2.8.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-3.2.8.RELEASE.jar;%APP_HOME%\lib\kieker-common-1.14.jar;%APP_HOME%\lib\findbugs-3.0.1.jar;%APP_HOME%\lib\logback-classic-1.1.7.jar;%APP_HOME%\lib\amqp-client-4.2.1.jar;%APP_HOME%\lib\teetime-3.0.jar;%APP_HOME%\lib\cxf-bundle-minimal-2.6.15.jar;%APP_HOME%\lib\oshi-core-3.12.2.jar;%APP_HOME%\lib\ehcache-core-2.5.1.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\groovy-testng-3.0.2.jar;%APP_HOME%\lib\testng-6.14.3.jar;%APP_HOME%\lib\jcommander-1.72.jar;%APP_HOME%\lib\jcip-annotations-1.0.jar;%APP_HOME%\lib\guava-23.6-jre.jar;%APP_HOME%\lib\jsr305-2.0.1.jar;%APP_HOME%\lib\bcel-findbugs-6.0.jar;%APP_HOME%\lib\jFormatString-2.0.1.jar;%APP_HOME%\lib\dom4j-1.6.1.jar;%APP_HOME%\lib\asm-debug-all-5.0.2.jar;%APP_HOME%\lib\asm-commons-5.0.2.jar;%APP_HOME%\lib\blueprints-core-2.6.0.jar;%APP_HOME%\lib\commons-configuration-1.6.jar;%APP_HOME%\lib\wss4j-1.6.16.jar;%APP_HOME%\lib\opensaml-2.6.1.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\AppleJavaExtensions-1.4.jar;%APP_HOME%\lib\jaxen-1.1.6.jar;%APP_HOME%\lib\jackson-databind-2.9.8.jar;%APP_HOME%\lib\jackson-core-2.9.8.jar;%APP_HOME%\lib\commons-math3-3.6.1.jar;%APP_HOME%\lib\commons-lang3-3.6.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\xml-apis-1.0.b2.jar;%APP_HOME%\lib\asm-tree-5.0.2.jar;%APP_HOME%\lib\jackson-annotations-2.9.0.jar;%APP_HOME%\lib\xz-1.6.jar;%APP_HOME%\lib\nanohttpd-2.3.0.jar;%APP_HOME%\lib\jctools-core-2.1.1.jar;%APP_HOME%\lib\aspectjrt-1.8.2.jar;%APP_HOME%\lib\aspectjweaver-1.8.2.jar;%APP_HOME%\lib\hamcrest-all-1.3.jar;%APP_HOME%\lib\powermock-module-junit4-rule-1.7.4.jar;%APP_HOME%\lib\powermock-api-easymock-1.7.4.jar;%APP_HOME%\lib\powermock-api-mockito2-1.7.4.jar;%APP_HOME%\lib\powermock-api-mockito-common-1.7.4.jar;%APP_HOME%\lib\powermock-api-support-1.7.4.jar;%APP_HOME%\lib\powermock-module-junit4-1.7.4.jar;%APP_HOME%\lib\powermock-module-junit4-common-1.7.4.jar;%APP_HOME%\lib\powermock-core-1.7.4.jar;%APP_HOME%\lib\javassist-3.24.1-GA.jar;%APP_HOME%\lib\groovy-test-3.0.2.jar;%APP_HOME%\lib\junit-4.13.jar;%APP_HOME%\lib\easymock-3.4.jar;%APP_HOME%\lib\mockito-core-2.8.9.jar;%APP_HOME%\lib\powermock-reflect-1.7.4.jar;%APP_HOME%\lib\objenesis-2.5.jar;%APP_HOME%\lib\logback-core-1.1.7.jar;%APP_HOME%\lib\groovy-ant-3.0.2.jar;%APP_HOME%\lib\groovy-astbuilder-3.0.2.jar;%APP_HOME%\lib\groovy-cli-picocli-3.0.2.jar;%APP_HOME%\lib\groovy-groovysh-3.0.2.jar;%APP_HOME%\lib\groovy-console-3.0.2.jar;%APP_HOME%\lib\groovy-datetime-3.0.2.jar;%APP_HOME%\lib\groovy-groovydoc-3.0.2.jar;%APP_HOME%\lib\groovy-docgenerator-3.0.2.jar;%APP_HOME%\lib\groovy-jmx-3.0.2.jar;%APP_HOME%\lib\groovy-json-3.0.2.jar;%APP_HOME%\lib\groovy-jsr223-3.0.2.jar;%APP_HOME%\lib\groovy-macro-3.0.2.jar;%APP_HOME%\lib\groovy-nio-3.0.2.jar;%APP_HOME%\lib\groovy-servlet-3.0.2.jar;%APP_HOME%\lib\groovy-sql-3.0.2.jar;%APP_HOME%\lib\groovy-swing-3.0.2.jar;%APP_HOME%\lib\groovy-templates-3.0.2.jar;%APP_HOME%\lib\groovy-test-junit5-3.0.2.jar;%APP_HOME%\lib\groovy-xml-3.0.2.jar;%APP_HOME%\lib\groovy-3.0.2.jar;%APP_HOME%\lib\asm-5.0.2.jar;%APP_HOME%\lib\hppc-0.7.3.jar;%APP_HOME%\lib\hamcrest-library-1.3.jar;%APP_HOME%\lib\jettison-1.3.3.jar;%APP_HOME%\lib\spring-jms-3.0.7.RELEASE.jar;%APP_HOME%\lib\spring-tx-3.0.7.RELEASE.jar;%APP_HOME%\lib\spring-context-3.0.7.RELEASE.jar;%APP_HOME%\lib\spring-aop-3.0.7.RELEASE.jar;%APP_HOME%\lib\spring-beans-3.0.7.RELEASE.jar;%APP_HOME%\lib\spring-expression-3.0.7.RELEASE.jar;%APP_HOME%\lib\spring-core-3.0.7.RELEASE.jar;%APP_HOME%\lib\openws-1.5.1.jar;%APP_HOME%\lib\xmltooling-1.4.1.jar;%APP_HOME%\lib\xmlsec-1.5.7.jar;%APP_HOME%\lib\commons-logging-1.1.1.jar;%APP_HOME%\lib\woodstox-core-asl-4.4.0.jar;%APP_HOME%\lib\stax2-api-3.1.4.jar;%APP_HOME%\lib\xmlschema-core-2.0.3.jar;%APP_HOME%\lib\geronimo-javamail_1.4_spec-1.7.1.jar;%APP_HOME%\lib\wsdl4j-1.6.3.jar;%APP_HOME%\lib\jaxb-impl-2.1.13.jar;%APP_HOME%\lib\jetty-security-7.5.4.v20111024.jar;%APP_HOME%\lib\jetty-server-7.5.4.v20111024.jar;%APP_HOME%\lib\jetty-continuation-7.5.4.v20111024.jar;%APP_HOME%\lib\jetty-http-7.5.4.v20111024.jar;%APP_HOME%\lib\jetty-io-7.5.4.v20111024.jar;%APP_HOME%\lib\jetty-util-7.5.4.v20111024.jar;%APP_HOME%\lib\geronimo-servlet_2.5_spec-1.1.2.jar;%APP_HOME%\lib\geronimo-jms_1.1_spec-1.1.1.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\spring-asm-3.0.7.RELEASE.jar;%APP_HOME%\lib\jaxb-xjc-2.1.13.jar;%APP_HOME%\lib\msv-core-2011.1.jar;%APP_HOME%\lib\xsdlib-2010.1.jar;%APP_HOME%\lib\isorelax-20030108.jar;%APP_HOME%\lib\relaxngDatatype-20020414.jar;%APP_HOME%\lib\xml-resolver-1.2.jar;%APP_HOME%\lib\asm-3.3.1.jar;%APP_HOME%\lib\xmlbeans-2.5.0.jar;%APP_HOME%\lib\joda-time-2.2.jar;%APP_HOME%\lib\serializer-2.7.1.jar;%APP_HOME%\lib\neethi-3.0.3.jar;%APP_HOME%\lib\jsr311-api-1.1.1.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\byte-buddy-1.6.14.jar;%APP_HOME%\lib\byte-buddy-agent-1.6.14.jar;%APP_HOME%\lib\cglib-nodep-2.2.2.jar;%APP_HOME%\lib\jna-platform-5.2.0.jar;%APP_HOME%\lib\jna-5.2.0.jar;%APP_HOME%\lib\ant-junit-1.10.7.jar;%APP_HOME%\lib\ant-1.10.7.jar;%APP_HOME%\lib\ant-launcher-1.10.7.jar;%APP_HOME%\lib\ant-antlr-1.10.7.jar;%APP_HOME%\lib\picocli-4.1.4.jar;%APP_HOME%\lib\qdox-1.12.1.jar;%APP_HOME%\lib\javaparser-core-3.15.13.jar;%APP_HOME%\lib\jline-2.14.6.jar;%APP_HOME%\lib\junit-platform-launcher-1.6.0.jar;%APP_HOME%\lib\junit-jupiter-engine-5.6.0.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\commons-collections-3.2.1.jar;%APP_HOME%\lib\commons-digester-1.8.jar;%APP_HOME%\lib\commons-beanutils-core-1.8.0.jar;%APP_HOME%\lib\bcprov-jdk15-1.46.jar;%APP_HOME%\lib\not-yet-commons-ssl-0.3.9.jar;%APP_HOME%\lib\junit-platform-engine-1.6.0.jar;%APP_HOME%\lib\junit-jupiter-api-5.6.0.jar;%APP_HOME%\lib\commons-beanutils-1.7.0.jar;%APP_HOME%\lib\servlet-api-2.5.jar;%APP_HOME%\lib\commons-httpclient-3.1.jar;%APP_HOME%\lib\opentest4j-1.2.0.jar;%APP_HOME%\lib\junit-platform-commons-1.6.0.jar;%APP_HOME%\lib\checker-compat-qual-2.0.0.jar;%APP_HOME%\lib\error_prone_annotations-2.1.3.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar

@rem Execute trace-analysis
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %TRACE_ANALYSIS_OPTS%  -classpath "%CLASSPATH%" kieker.tools.trace.analysis.TraceAnalysisToolMain %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable TRACE_ANALYSIS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%TRACE_ANALYSIS_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
