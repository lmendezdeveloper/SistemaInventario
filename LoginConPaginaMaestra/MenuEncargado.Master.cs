using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInventario
{
    public partial class MenuEncargado : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cargo = (string)Session["Charge"];
                switch (cargo)
                {
                    case null:
                        Response.Redirect("login.aspx");
                        break;
                    case "1":
                        Response.Redirect("Inicio.aspx");
                        break;
                    case "2":
                        break;
                    case "3":
                        Response.Redirect("Inicio_visor.aspx");
                        break;
                    default:
                        Response.Redirect("Inicio_encargado.aspx");
                        break;
                }
            }
        }
    }
}