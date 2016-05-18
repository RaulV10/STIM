/*
    Clase para gestionar la conectividad y operacion con la base de datos
 */
package clases;

/**
 *
 * @author Raul V
 */

// Importacion de librerias para los objetos de acceso a datos
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {
    private Connection conexion; // Establecer conexion a MySQL
    private Statement instruccionSQL; // Esta es la instruccion SQL a MySQL
    
    public Conexion() throws ClassNotFoundException, SQLException {
        // localizacion de la clase en el archivo.jar
        Class.forName("com.mysql.jdbc.Driver");
        
        // localhost = 127.0.0.1
        conexion = DriverManager.getConnection(
                    "jdbc:mysql://127.0.0.1/stim", 
                    "root", 
                    ""
        );
    }
    
    // Metodo para enviar instrucciones SQL a MySQL
    public void ejecutarSQL(String sql) throws SQLException {
        instruccionSQL = conexion.createStatement();
        instruccionSQL.execute(sql);
    }
    
    public ResultSet consultar(String sql) throws SQLException{
        instruccionSQL = conexion.createStatement();
        return instruccionSQL.executeQuery(sql);
    }

    PreparedStatement prepareStatement(String select_idusuario_password_from_usuario_wh) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}