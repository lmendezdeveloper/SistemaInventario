using System;
using Biblioteca;

namespace SistemaInventario
{
    public partial class producto_encargado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        Producto evento = new Producto();

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtCod.Text == "" || txtNombre.Text == "" || txtMarca.Text == "" || txtModelo.Text == "" || txtFactura.Text == "" || txtPrecio.Text == "" || txtDate.Text == "")
            {
                lblError.Text = "Debe Completar los datos Solicitados";
            }

            if (evento.InserProd(txtCod.Text, txtNombre.Text, txtMarca.Text, txtModelo.Text, txtFactura.Text, txtPrecio.Text, txtDate.Text))
            {
                Response.Write("<script>window.alert('Agregado Correctamente')</script>");
                gvUsers.DataBind();
                txtCod.Text = "";
                txtNombre.Text = "";
                txtMarca.Text = "";
                txtModelo.Text = "";
                txtFactura.Text = "";
                txtPrecio.Text = "";
                txtDate.Text = "";
            }
            else
            {
                lblError.Text = "Error Al Ingresar, Intente de nuevo";
            }

        }
    }
}