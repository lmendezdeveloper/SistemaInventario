using System;
using Biblioteca;

namespace SistemaInventario
{
    public partial class contrato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Contrato evento = new Contrato();

            if (txtNombre.Text == "")
            {
                lblError.Text = "Debe Completar los datos Solicitados";
            }
            else
            {
                if (evento.InserContrato(txtNombre.Text))
                {
                    Response.Write("<script>window.alert('Agregado Correctamente')</script>");
                    gvContrato.DataBind();
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