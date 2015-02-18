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
    	rs = sentencia.executeQuery("SELECT u.id_usuario, u.nombre, u.direccion, u.correo  FROM usuario u WHERE id_usuario=1");
    	
    	while(rs.next()){
    		%>
    		
    		<%=rs.getString("id_usuario")%>
    		<%=rs.getString("nombre")%>
    		<%=rs.getString("direccion")%>
    		<%=rs.getString("correo")%>
    	
    		<a href="formulariomodificarp.jsp?id_usuario=<%=rs.getString("id_usuario")%>">modificar</a>
    		<br/>
    		
    		<%
		}
    	
    	%>
    	
    	
    	
    	
    	<form action="insertardetalle.jsp" method="post">
		<fieldset>
			<legend>datos de envio y pago</legend>
			<p>
			<label for="id_producto">dv_id_producto: </label>
				<input type="text" value=<%=request.getParameter("id_producto")%> name="id_producto" />
			</p>
			
			<p>
			<label for="pago">Forma de pago: </label>
			<input type="text" name="pago" />
			</p>
			<p>
			<label for="envio">envio: </label>
			<input type="text" name="envio" />
			</p>
			<p>
			<label for="cantidad">cantidad: </label>
			<input type="text" name="cantidad" />
			</p>
			<p>
				<input type="submit" value="Guardar"/>
			</p>
			
		</fieldset>
	</form>
	
    	<%
			
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