using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data.Linq;

namespace Biblioteca
{
    internal class conexionDB : DataContext
    {
        public Table<usuario> usuario;

        public conexionDB() : base("Data Source=DESKTOP-B9KBSUN;Initial Catalog=inventario;Integrated Security=True") { }
        
        public SqlConnection getConexion()
        {
            try
            {
                string cadena = @"Data Source=DESKTOP-B9KBSUN;Initial Catalog=inventario;Integrated Security=True";
                SqlConnection cn = new SqlConnection(cadena);
                cn.Open();
                return cn;
            }
            catch (Exception)
            {
                return null;
            }
        }
        
    }
}
