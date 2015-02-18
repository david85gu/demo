
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   Connection conexion=null;
   Statement sentencia=null;
    ResultSet rs=null;
    
    try{
    	
Class.forName("com.mysql.jdbc.Driver");
    	
    	conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/compras","root","ui180841");
    	sentencia = conexion.createStatement();
    	rs = sentencia.executeQuery("Select * from producto");
    	
    	while(rs.next()){
    		%>
    		
    		<%=rs.getString("id_producto")%>
    		<%=rs.getString("nombre")%>
    		<%=rs.getString("genero")%>
    		<%=rs.getString("precio")%>
    	
    		<a href="mostrarpersona.jsp?id_producto=<%=rs.getString("id_producto")%>">comprar</a>
    		<br/>
    		
    		<%
		}
    }catch (ClassNotFoundException e) {
		System.out.println("Error en la carga del driver: "
				+ e.getMessage());
	} catch (SQLException e) {
		System.out.println("Error accediendo a las BDs: "
				+ e.getMessage());
	} finally {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("Error cerrando el ResultSet: "
						+ e.getMessage());
			}

		}
		if (sentencia != null) {
			try {
				sentencia.close();
			} catch (SQLException e) {
				System.out.println("Error cerrando sentencia: "
						+ e.getMessage());
			}

		}
		if (conexion != null) {
			try {
				conexion.close();
			} catch (SQLException e) {
				System.out.println("Error cerrando la conexión: "
						+ e.getMessage());
			}
		}
	}
%>
</body>
</html>