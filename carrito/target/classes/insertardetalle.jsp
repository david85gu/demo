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
		Connection conexion = null;
		Statement sentencia = null;
		ResultSet rs = null;
		
		//Recogiendo parámetros
		
		String idp = request.getParameter("id_producto");
		//String idu = request.getParameter("dv_id_usuario");
		String pago = request.getParameter("pago");
		String envio = request.getParameter("envio");
		String cantidad = request.getParameter("cantidad");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/compras","root","ui180841");
			sentencia = conexion.createStatement();
			
			String sql = "INSERT INTO detalleventa (dv_id_producto, dv_id_usuario,  pago, envio, cantidad) VALUES('"+idp+"','"+1+"','"+pago+"','"+envio+"','"+cantidad+"')";
			
			sentencia.executeUpdate(sql);
			
			response.sendRedirect("mostrar.jsp");
		}catch(ClassNotFoundException e){
			System.out.println("Error en la carga del driver: "+e.getMessage());			
		}catch(SQLException e){
			System.out.println("Error accediendo a las BDs: " +e.getMessage());
		}finally{
			if(rs!=null){
				try{
					rs.close();
				}catch(SQLException e){
					System.out.println("Error cerrando el ResultSet: "+e.getMessage());
				}
				
			}
			if(sentencia!=null){
				try{
					sentencia.close();
				}catch(SQLException e){
					System.out.println("Error cerrando sentencia: "+e.getMessage());
				}
				
			}
			if(conexion!=null){
				try{
					conexion.close();
				}catch(SQLException e){
					System.out.println("Error cerrando la conexión: "+e.getMessage());
				}
			}
		}
	%>
</body>
</html>