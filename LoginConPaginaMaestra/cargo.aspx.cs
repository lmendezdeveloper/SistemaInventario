using System;
using Biblioteca;

namespace SistemaInventario
{
    public partial class cargo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Cargo evento = new Cargo();

            if (txtNombre.Text == "")
            {
                lblError.Text = "Debe Completar los datos Solicitados";
            }
            else
            {
                if (evento.InserCargo(txtNombre.Text))
                {
                    Response.Write("<script>window.alert('Agregado Correctamente')</script>");
                    gvCargo.DataBind();
                    txtNombre.Text = "";
                }
                else
                {
                    lblError.Text = "Error Al Ingresar, Intente de nuevo";
                }
            }
        }
    }
}