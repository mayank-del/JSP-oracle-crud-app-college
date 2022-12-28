<%@page import="java.sql.*"%>


<html>
<head>
<title>Obtaining a Connection</title>
</head>
<body>
<h1>This Page Obtains a Connection to a Database and executes a query</h1>
<%
    Connection conn = null;
    ResultSet result = null;
    Statement stmt = null;
	String ou="";
	int i=1;
	String cmd,constr,user,pass;
    try {

		//Class.forName("oracle.jdbc.OracleDriver");

		DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
		
		user="C##IT1_9";

		pass="C##IT1_9";
		
		constr="jdbc:oracle:thin:" + user + "/" + pass;
 
		conn = DriverManager.getConnection(constr + "@192.168.5.251:1521/orcl");
		
		stmt = conn.createStatement(); 
		
		/*cmd1=request.getParameter("cmd1");		
			cmd1.trim();
		cmd2=request.getParameter("cmd2");		
			cmd2.trim();
		cmd3=request.getParameter("cmd3");		
			cmd3.trim();
		cmd4=request.getParameter("cmd4");		
			cmd4.trim();*/
		
		String abc = request.getParameter("querytype");
			
			if(abc.equals("create"))
			
			{
				int stat1= stmt.executeUpdate("CREATE TABLE STUDENT00999(ROLL VARCHAR2(10),NAME VARCHAR2(10),DEPT VARCHAR2(10))");

				ou="SQL Run Successfully the following command<br>";
			
	                	out.println(ou + "<br><font color='blue'></font>");
			}
			
		 
		
		else if(abc.equals("insert")){
			String roll=request.getParameter("roll");
			String name=request.getParameter("name");
			String dept=request.getParameter("dept");
			int stat2=stmt.executeUpdate("INSERT INTO STUDENT0099 VALUES('"+roll+"','"+name+"','"+dept+"')");
			ou="insertion Successful<br>";
		 }
		 else if(abc.equals("update")){
		 	 String roll=request.getParameter("roll");
		 	 String dept=request.getParameter("dept");
		 	 String ndept=request.getParameter("dept2");
		 	 int stat3=stmt.executeUpdate("UPDATE STUDENT0099 SET DEPT='"+ndept+"' WHERE ROLL='"+roll+"'");
		 	 ou="updation Successful<br>";
		 	}
		 else if(abc.equals("delete")){
		 	String roll=request.getParameter("roll");
		 	int stat4=stmt.executeUpdate("DELETE FROM STUDENT0099 WHERE ROLL='"+roll+"'");
		 	ou="deletion Successful<br>";
		 }
		 	 
		 else{
		 	result = stmt.executeQuery("SELECT * FROM STUDENT0099");
					while(result.next())
					{
			%>
				
					<table>
					<tr>
					<td><%=result.getString(1) %></td>
					<td><%=result.getString(2) %></td>
					<td><%=result.getString(3) %></td>
					</tr>
					
					<%
					
					}
       
			}
		 
		
		%>
			</table>
		<a href="login.html">click to go back</a>
		<%		

		conn.close();
		stmt.close();
		}
     catch (SQLException e) {
         out.println("Error occurred "  +  e);
      }
%>
</body>
</html>
		
		
