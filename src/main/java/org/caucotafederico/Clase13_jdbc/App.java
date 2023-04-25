package org.caucotafederico.Clase13_jdbc;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static org.caucotafederico.Clase13.conexion.ConectorSQL.*;

public class App 
{
    public static void main( String[] args )
    {
    	Connection con = null;
    	try {
    		
			//Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			Statement query = con.createStatement();
			
			// Ejercicio 3-a //Insertar un empleado nuevo en la nómina de trabajo.
			int rs1 = query.executeUpdate("INSERT INTO empleado(dni, nombre, apellido) VALUES (28574158, \"Juan Manuel\", \"Gamarra\") ");
			rs1 = query.executeUpdate("INSERT INTO empleado_nacionalidad(empleado_id, pais_id) VALUES(LAST_INSERT_ID(),1);");
			
			// Ejercicio 3-b // Modificar la nacionalidad de algún empleado.
			rs1 = query.executeUpdate("UPDATE empleado_nacionalidad SET pais_id = 3 WHERE empleado_id = 2");
			
			// Ejercicio 3-c  // Eliminar un departament
			rs1 = query.executeUpdate("DELETE FROM departamento_presupuesto WHERE departamento_id = 5;");
			rs1 = query.executeUpdate("DELETE FROM departamento WHERE id = 5;");
			
			// Ejercicio 3-d //Conocer los empleados que trabajan en el departamento de “logística” ” (puede ser cualquiera de los que agreguen).
			ResultSet rs = query.executeQuery("SELECT * FROM empleado WHERE id IN (SELECT empleado_id FROM departamento_empleado WHERE departamento_id IN (SELECT id FROM departamento WHERE UPPER(nombre) like \"COMPRAS\"));");
			System.out.println("LISTADO DE EMPLEADOS DE COMPRAS");
			while (rs.next()){
				System.out.println( rs.getString(4) + ", " + rs.getString(3) + "  DNI: "+ rs.getString(2) );
			}
						
			
			// Ejercicio 3-e //Mostrar todos los departamentos ordenados alfabéticamente.
			
			rs = query.executeQuery("SELECT nombre FROM departamento ORDER BY nombre");
			
			System.out.println("");
			System.out.println("");
			System.out.println("LISTADO DE DEPARTAMENTOS ORDENADOS ALFABETICAMENTE");
			while (rs.next()){
				System.out.println(rs.getString(1));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

    }
}
