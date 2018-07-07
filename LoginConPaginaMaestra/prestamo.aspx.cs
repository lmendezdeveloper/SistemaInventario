using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Biblioteca;
using System.IO;
using System.Text;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace SistemaInventario
{
    public partial class prestamo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        Prestamo evento = new Prestamo();

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtDescripción.Text == "" || txtDate.Text == "" || txtDateEntrega.Text == "")
            {
                lblError.Text = "Debe Completar los datos Solicitados";
            }
            else
            {
                if (evento.InserPres(txtDate.Text, txtDateEntrega.Text, txtDescripción.Text, "Prestado", dpTipoPrestamo.Text, dpProducto.Text, dpTrabajor.Text, dpTrabajor.Text))
                {
                    Response.Write("<script>window.alert('Agregado Correctamente')</script>");

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);

                    StringWriter sw = new StringWriter();
                    HtmlTextWriter hw = new HtmlTextWriter(sw);

                    panelPDF2.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
                    HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

                    pdfDoc.Open();
                    htmlParser.Parse(sr);
                    pdfDoc.Close();

                    Response.Write(pdfDoc);
                    Response.End();
                }
                else
                {
                    lblError.Text = "Error Al Ingresar, Intente de nuevo";
                }
            }

        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            panelPDF.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
            HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();
            htmlParser.Parse(sr);
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }
    }
}