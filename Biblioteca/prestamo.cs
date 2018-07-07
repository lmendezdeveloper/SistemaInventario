using System;
using System.Data.SqlClient;

namespace Biblioteca
{
    public class Prestamo
    {
        conexionDB cn = new conexionDB();

        public bool InserPres(string fecha, string fechaEntrega, string observacion, string estado, string idtipoPrestamo, string idProducto, string idTrabajador, string idUsuario)
        {
            try
            {
                string sql = "insert into Prestamo values ('" + fecha + "', '" + fechaEntrega + "', '" + observacion + "', '" + estado + "', " + idtipoPrestamo + ", " + idProducto + ", " + idTrabajador + ", " + idUsuario + ");";
                SqlCommand cmd = new SqlCommand(sql, cn.getConexion());
                int n = cmd.ExecuteNonQuery();
                return n > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
