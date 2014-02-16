Java 7 as a platform
Apache derby as DB.
Can conflict with older Spring versions in .m2, it helps to remove them.

To run Apache derby DB on Windows console:

>cd "%JAVA_HOME%\db\bin"
>startNetworkServer.bat

to create and fulfill schema in new console:

>cd "%JAVA_HOME%\db\bin"
>ij
>CONNECT 'jdbc:derby://localhost:1527/c:\\db\\eshop;user=ESHOP;create=true';

then execute sql from eshop\sql.

Check database.properties
