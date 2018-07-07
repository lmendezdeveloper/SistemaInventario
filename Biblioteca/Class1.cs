using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca
{
    public class Class1
    {
        int idX;
        List<Class1> listUs = new List<Class1>();
        public int id { get; set; }
        public string usuario { get; set; }
        public string clave { get; set; }
        public string nombre { get; set; }
        public string cargo { get; set; }

        public Class1()
        {
        }

        public Class1(int id, string usuario, string clave, string nombre, string cargo)
        {
            this.id = id;
            this.usuario = usuario;
            this.clave = clave;
            this.nombre = nombre;
            this.cargo = cargo;
        }

        public bool addUs(string usuario, string clave, string nombre, string cargo)
        {
            Class1 nuevo = new Class1();
            var query = from x in listUs
                        select x;

            if (query.Count() > 0)
            {
                idX = query.Count() + 1;
            }
            else
            {
                idX = 1;
            }
            try
            {
                nuevo.id = idX;
                nuevo.usuario = usuario;
                nuevo.clave = clave;
                nuevo.nombre = nombre;
                nuevo.cargo = cargo;
                listUs.Add(nuevo);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
