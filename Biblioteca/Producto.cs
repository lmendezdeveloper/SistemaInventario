using System;
using System.Data;
using System.Data.SqlClient;

namespace Biblioteca
{
    public class Producto
    {
        conexionDB cn = new conexionDB();

        public bool InserProd(string CodigoGenerico, string nombre, string marca, string modelo, string numeroFactura, string precio, string fechaCompra)
        {
            try
            {
                string sql = "insert into Producto values ('" + CodigoGenerico + "', '" + nombre + "', '" + marca + "', '" + modelo + "', '" + numeroFactura + "', " + precio + ", '" + fechaCompra + "');";
                SqlCommand cmd = new SqlCommand(sql, cn.getConexion());
                int n = cmd.ExecuteNonQuery();
                return n > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public DataSet ListProd()
        {
            try
            {
                DataSet ds = new DataSet();
                string sql = "select * from Producto";
                SqlDataAdapter dt = new SqlDataAdapter(sql, cn.getConexion());
                int n = dt.Fill(ds);
                return ds;
            }
            catch (Exception)
            {

                return null;
            }


        }
    }
}
