using System;
using Biblioteca;

namespace SistemaInventario
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (txtUser.Text == "" || txtPass.Text == "")
            {
                Response.Write("Debe Completar los datos Solicitados");
            }
            else
            {
                usuario user = usuario.IniciarSesion(txtUser.Text, txtPass.Text);
                if (user == null)
                {
                    Response.Write("<script>window.alert('Usuario invalido')</script>");
                }
                else
                {
                    string cargo = user.idCargo.ToString();
                    Session["idUser"] = user.idUsuario.ToString();
                    Session["nameUser"] = user.nombre.ToString() + " " + user.apellidoP.ToString();
                    Session["Charge"] = user.idCargo.ToString();

                    if (cargo == "1")
                    {
                        Response.Redirect("Inicio.aspx");
                    }
                    else if (cargo == "2")
                    {
                        Response.Redirect("Inicio_encargado.aspx");
                    }
                    else if (cargo == "3")
                    {
                        Response.Redirect("Inicio_visor.aspx");
                    }
                }

            }
        }


    }
}