using System;
using System.Data.SqlClient;

namespace Biblioteca
{
    public class Contrato
    {
        conexionDB cn = new conexionDB();

        public bool InserContrato(string descripcion)
        {
            try
            {
                string sql = "insert into Contrato values ('" + descripcion + "');";
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
