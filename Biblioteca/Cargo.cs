using System;
using System.Data.SqlClient;

namespace Biblioteca
{
    public class Cargo
    {
        conexionDB cn = new conexionDB();

        public bool InserCargo(string descripcion)
        {
            try
            {
                string sql = "insert into Cargo values ('" + descripcion + "');";
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
