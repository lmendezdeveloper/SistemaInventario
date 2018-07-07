<%@ Page Title="" Language="C#" MasterPageFile="~/MenuAdmin.Master" AutoEventWireup="true" CodeBehind="producto.aspx.cs" Inherits="SistemaInventario.producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Gestión Producto</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
        <asp:Button Text="PDF" runat="server" CssClass="btn btn-block btn-success" ID="ButtonPDF" OnClick="btnPDF_Click" />
    </div>
    <div class="form-row">
        <div class="col-md-4">
            <br>
            <asp:Label Text="Codigo Generico: " runat="server" />
            <asp:TextBox ID="txtCod" runat="server" Placeholder="X01E02" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Nombre: " runat="server" />
            <asp:TextBox ID="txtNombre" runat="server" Placeholder="Producto X" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Marca: " runat="server" />
            <asp:TextBox ID="txtMarca" runat="server" Placeholder="Lenovo" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Modelo: " runat="server" />
            <asp:TextBox ID="txtModelo" runat="server" Placeholder="E-431" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="N° Factura: " runat="server" />
            <asp:TextBox ID="txtFactura" runat="server" Placeholder="0001   " CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Precio: " runat="server" />
            <asp:TextBox ID="txtPrecio" runat="server" Placeholder="10000" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Fecha Compra: " runat="server" />
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" PlaceHolder="dd/mm/aaaa"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <br>
            <asp:Button Text="GUARDAR" runat="server" CssClass="btn btn-block btn-success" ID="btnGuardar" OnClick="btnGuardar_Click" />
            <asp:Label Text="" runat="server" ID="lblError" CssClass="alert-danger" />
        </div>
    </div>
    <br>
    <br>
    <div class="form-row">
        <div class="col-md-12">
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataSourceID="inventario" DataKeyNames="idProducto" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:TemplateField HeaderText="Codigo">
                        <ItemTemplate>
                            <asp:Label ID="lblEditCodigoGenerico" runat="server"><%# Eval("CodigoGenerico")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditCodigoGenerico" runat="server" Text='<%# Bind("CodigoGenerico")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <ItemTemplate>
                            <asp:Label ID="lblEditNombre" runat="server"><%# Eval("nombre")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditNombre" runat="server" Text='<%# Bind("nombre")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marca">
                        <ItemTemplate>
                            <asp:Label ID="lblEditMarca" runat="server"><%# Eval("marca")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditMarca" runat="server" Text='<%# Bind("marca")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modelo">
                        <ItemTemplate>
                            <asp:Label ID="lblEditModelo" runat="server"><%# Eval("modelo")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditModelo" runat="server" Text='<%# Bind("modelo")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Factura">
                        <ItemTemplate>
                            <asp:Label ID="lblEditFactura" runat="server"><%# Eval("numeroFactura")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditFactura" runat="server" Text='<%# Bind("numeroFactura")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio">
                        <ItemTemplate>
                            <asp:Label ID="lblEditPrecio" runat="server"><%# Eval("precio")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditPrecio" runat="server" Text='<%# Bind("precio")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha Compra">
                        <ItemTemplate>
                            <asp:Label ID="lblEditFechaCompra" runat="server"><%# Eval("fechaCompra", "{0:d}") %></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditFechaCompra" runat="server" Text='<%# Bind("fechaCompra")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="200px">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit" />
                            <asp:Button ID="btnDelete" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('¿Eliminar usuario?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Grabar" CssClass="btn btn-success" CommandName="Update" OnClientClick="return confirm('¿Seguro que quiere modificar los datos del usuario?');" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="inventario" runat="server"
                ConnectionString="<%$ ConnectionStrings:inventarioConnectionString %>"
                SelectCommand="SELECT *FROM Producto;"
                DeleteCommand="DELETE FROM [Producto] WHERE [idProducto] = @idProducto"
                UpdateCommand="UPDATE [Producto] SET [CodigoGenerico] = @CodigoGenerico, [nombre] = @nombre, [marca] = @marca, [modelo] = @modelo, [numeroFactura] = @numeroFactura, [precio] = @precio, [fechaCompra] = @fechaCompra WHERE [idProducto] = @idProducto">
                <DeleteParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CodigoGenerico" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="marca" Type="String" />
                    <asp:Parameter Name="modelo" Type="String" />
                    <asp:Parameter Name="numeroFactura" Type="String" />
                    <asp:Parameter Name="precio" Type="String" />
                    <asp:Parameter Name="fechaCompra" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
