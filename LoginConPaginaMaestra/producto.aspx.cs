using System;
using Biblioteca;
using System.IO;
using System.Diagnostics;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace SistemaInventario
{
    public partial class producto : System.Web.UI.Page
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

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            /*
            //- CREA UN NUEVO DOCUMENTO
            string fileName = System.IO.Path.GetTempPath() + Guid.NewGuid().ToString() + ".pdf";
            Document document = new Document(PageSize.A4, 25, 25, 50, 50);
            PdfWriter.GetInstance(document, new FileStream(fileName, FileMode.Create));
            document.Open();

            //- GENERAR UN NUEVO PARRAFO
            Paragraph parrafo = new Paragraph();

            parrafo.Alignment = Element.ALIGN_CENTER;
            parrafo.Font = FontFactory.GetFont("Arial", 24);
            parrafo.Font.SetStyle(Font.BOLD);
            parrafo.Font.SetStyle(Font.UNDERLINE);

            parrafo.Add("Reporte de existencias");

            document.Add(parrafo);

            var producto = from p in evento.
                           select new { id = p.id_producto, codigo = p.codigo_generico, p.nombre, p.marca, p.modelo, p.stock, p.precio };

            PdfPTable tabla_productos = new PdfPTable(7);
            tabla_productos.SetTotalWidth(new float[] {
                (iTextSharp.text.PageSize.A4.Rotate().Width - 25) / 7,
                (iTextSharp.text.PageSize.A4.Rotate().Width - 25) / 7,
                (iTextSharp.text.PageSize.A4.Rotate().Width - 25) / 7,
                (iTextSharp.text.PageSize.A4.Rotate().Width - 25) / 7,
                (iTextSharp.text.PageSize.A4.Rotate().Width - 25) / 7,
                (iTextSharp.text.PageSize.A4.Rotate().Width - 25) / 7,
                (iTextSharp.text.PageSize.A4.Rotate().Width - 25) / 7
            });

            //Headers
            tabla_productos.AddCell(new Paragraph("ID"));
            tabla_productos.AddCell(new Paragraph("CODIGO"));
            tabla_productos.AddCell(new Paragraph("PRODUCTO"));
            tabla_productos.AddCell(new Paragraph("MODELO"));
            tabla_productos.AddCell(new Paragraph("MARCA"));
            tabla_productos.AddCell(new Paragraph("STOCK"));
            tabla_productos.AddCell(new Paragraph("PRECIO"));

            //¿Le damos un poco de formato?
            foreach (PdfPCell celda in tabla_productos.Rows[0].GetCells())
            {
                celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                celda.HorizontalAlignment = 1;
                celda.Padding = 3;
            }

            foreach (var item in producto)
            {
                PdfPCell celda1 = new PdfPCell(new Paragraph(item.id.ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda2 = new PdfPCell(new Paragraph(item.codigo.ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda3 = new PdfPCell(new Paragraph(item.nombre.ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda4 = new PdfPCell(new Paragraph(item.marca.ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda5 = new PdfPCell(new Paragraph(item.modelo.ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda6 = new PdfPCell(new Paragraph(item.stock.ToString(), FontFactory.GetFont("Arial", 10)));
                PdfPCell celda7 = new PdfPCell(new Paragraph(item.precio.ToString(), FontFactory.GetFont("Arial", 10)));

                tabla_productos.AddCell(celda1);
                tabla_productos.AddCell(celda2);
                tabla_productos.AddCell(celda3);
                tabla_productos.AddCell(celda4);
                tabla_productos.AddCell(celda5);
                tabla_productos.AddCell(celda6);
                tabla_productos.AddCell(celda7);
            }

            document.Add(tabla_productos);

            document.Close();

            Process prc = new System.Diagnostics.Process();
            prc.StartInfo.FileName = fileName;
            prc.Start();
            */
        }
    }
}