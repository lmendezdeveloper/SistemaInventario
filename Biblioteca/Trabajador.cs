using System;
using System.Data.SqlClient;

namespace Biblioteca
{
    public class Trabajador
    {
        conexionDB cn = new conexionDB();

        public bool InserTrab(string rut, string nombre, string apellidop, string apellidom, string clave, string fecha, string cargo)
        {
            try
            {
                string sql = "insert into Trabajador values ('" + rut + "', '" + clave + "', '" + nombre + "', '" + apellidop + "', '" + apellidom + "', '" + fecha + "', " + cargo + ");";
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
