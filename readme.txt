Git is a distributed version control system.
Git is free software distributed under the GPL.
at 2016-04-01 21:42:52 I have a little chat with Tiger.
Git has a mutable index called stage.
Git tracks changes of files.
My stupid boss still prefers SVN.
Today is a new day, the most appreciate song is 'like sunday like rain'.
2016-04-02 10:32:47
Chapter 7 : visit database with JDBC
	JDBC URL Format

	The JDBC URL format for MySQL Connector/J is as follows, with items in square brackets ([, ]) being optional:

	jdbc:mysql://[host][,failoverhost...][:port]/[database] ?
	[?propertyName1][=propertyValue1][&propertyName2][=propertyValue2]...
	If the host name is not specified, it defaults to 127.0.0.1. If the port is not specified, it defaults to 3306, the default port number for MySQL servers.

	jdbc:mysql://[host:port],[host:port].../[database] ?
	[?propertyName1][=propertyValue1][&propertyName2][=propertyValue2]...
	Here is a sample connection URL:

	jdbc:mysql://localhost:3306/sakila?profileSQL=true
	
	Using JDBC Statement Objects to Execute SQL
	Statement objects allow you to execute basic SQL queries and retrieve the results through the ResultSet class, which is described later.
	To create a Statement instance, you call the createStatement() method on the Connection object you have retrieved using one of the DriverManager.getConnection() or DataSource.getConnection() methods described earlier.
	Once you have a Statement instance, you can execute a SELECT query by calling the executeQuery(String) method with the SQL you want to use.
	To update data in the database, use the executeUpdate(String SQL) method. This method returns the number of rows matched by the update statement, not the number of rows that were modified.
	If you do not know ahead of time whether the SQL statement will be a SELECT or an UPDATE/INSERT, then you can use the execute(String SQL) method. This method will return true if the SQL query was a SELECT, or false if it was an UPDATE, INSERT, or DELETE statement. If the statement was a SELECT query, you can retrieve the results by calling the getResultSet() method. If the statement was an UPDATE, INSERT, or DELETE statement, you can retrieve the affected rows count by calling getUpdateCount() on the Statement instance.

	
	