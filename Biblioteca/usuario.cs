using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Data.Linq.SqlClient;


namespace Biblioteca
{
    [Table(Name = "Usuario")]
    public class usuario
    {
        conexionDB cn = new conexionDB();

        #region Propiedades
        [Column(IsDbGenerated = true, IsPrimaryKey = true)]
        public int idUsuario { get; set; }
        [Column]
        public string rut { get; set; }
        [Column]
        public string clave { get; set; }
        [Column]
        public string nombre { get; set; }
        [Column]
        public string apellidoP { get; set; }
        [Column]
        public string apellidoM { get; set; }
        [Column]
        public DateTime fechaDeIngreso { get; set; }
        [Column()]
        public int idCargo { get; set; }
        #endregion

        #region Metodos
        public static usuario IniciarSesion(string user, string pass)
        {
            using (conexionDB db = new conexionDB())
            {
                usuario query = (from u in db.usuario
                                 where u.rut == user && u.clave == pass
                                 select u).SingleOrDefault();
                return query;
            }
        }
        #endregion

        
        public bool InsertUser(string rut, string nombre, string apellidop, string apellidom, string clave, string fecha, string cargo)
        {
            try
            {
                string sql = "insert into Usuario values ('" + rut + "', '" + clave + "', '" + nombre + "', '" + apellidop + "', '" + apellidom + "', '" + fecha + "', " + cargo + ");";
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
