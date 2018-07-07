<%@ Page Title="" Language="C#" MasterPageFile="~/MenuEncargado.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="prestamo.aspx.cs" Inherits="SistemaInventario.prestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Gestión Prestamos</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <asp:Panel ID="panelPDF2" runat="server">
        <div class="form-row">
            <div class="col-md-12">
                <br>
                <asp:Label Text="Descripción: " runat="server" />
                <asp:TextBox ID="txtDescripción" runat="server" Placeholder="Decripción del prestamo" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <br>
                <asp:Label Text="Fecha Prestamo: " runat="server" />
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" PlaceHolder="dd/mm/aaaa"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <br>
                <asp:Label Text="Fecha Entrega: " runat="server" />
                <asp:TextBox ID="txtDateEntrega" runat="server" TextMode="Date" CssClass="form-control" PlaceHolder="dd/mm/aaaa"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <br>
                <asp:Label Text="Tipo Prestamo: " runat="server" />
                <asp:DropDownList ID="dpTipoPrestamo" runat="server" CssClass="form-control" DataSourceID="listTipoPrestamo" DataTextField="descripcion" DataValueField="idtipoPrestamo"></asp:DropDownList>
                <asp:SqlDataSource ID="listTipoPrestamo" runat="server" ConnectionString="<%$ ConnectionStrings:inventarioConnectionString %>" SelectCommand="SELECT * FROM [tipoPrestamo]"></asp:SqlDataSource>
            </div>
            <div class="col-md-4">
                <br>
                <asp:Label Text="Producto: " runat="server" />
                <asp:DropDownList ID="dpProducto" runat="server" CssClass="form-control" DataSourceID="listProducto" DataTextField="nombre" DataValueField="idProducto"></asp:DropDownList>
                <asp:SqlDataSource ID="listProducto" runat="server" ConnectionString="<%$ ConnectionStrings:inventarioConnectionString %>" SelectCommand="SELECT * FROM [Producto]"></asp:SqlDataSource>
            </div>
            <div class="col-md-4">
                <br>
                <asp:Label Text="Trabajador: " runat="server" />
                <asp:DropDownList ID="dpTrabajor" runat="server" CssClass="form-control" DataSourceID="listTrabajor" DataTextField="nombre" DataValueField="idTrabajador"></asp:DropDownList>
                <asp:SqlDataSource ID="listTrabajor" runat="server" ConnectionString="<%$ ConnectionStrings:inventarioConnectionString %>" SelectCommand="SELECT * FROM [Trabajador]"></asp:SqlDataSource>
            </div>
            <div class="col-md-4">
                <br>
                <asp:Label Text="Usuario: " runat="server" />
                <asp:DropDownList ID="dpUsuario" runat="server" CssClass="form-control" DataSourceID="listUsuario" DataTextField="nombre" DataValueField="idUsuario"></asp:DropDownList>
                <asp:SqlDataSource ID="listUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:inventarioConnectionString %>" SelectCommand="SELECT * FROM [Usuario]"></asp:SqlDataSource>
            </div>
        </div>
    </asp:Panel>
    <div class="form-row">
        <div class="col-md-8    ">
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
    <asp:Panel ID="panelPDF" runat="server">
        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataSourceID="inventario" DataKeyNames="idPrestamo" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField HeaderText="Fecha Prestamo" DataField="fecha" InsertVisible="False" ReadOnly="True" DataFormatString="{0:d}" SortExpression="fecha" />
                <asp:BoundField HeaderText="Fecha Entrega" DataField="fechaEntrega" InsertVisible="False" ReadOnly="True" DataFormatString="{0:d}" SortExpression="fechaEntrega" />
                <asp:TemplateField HeaderText="Observación">
                    <ItemTemplate>
                        <asp:Label ID="lblEditObs" runat="server"><%# Eval("observacion")%></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditObs" runat="server" Text='<%# Bind("observacion")%>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label ID="lblEditEstado" runat="server"><%# Eval("estado")%></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditEstado" runat="server" Text='<%# Bind("estado")%>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Tipo Prestamo" DataField="tipoPrestamo" InsertVisible="False" ReadOnly="True" SortExpression="tipoPrestamo" />
                <asp:BoundField HeaderText="Producto" DataField="producto" InsertVisible="False" ReadOnly="True" SortExpression="producto" />
                <asp:BoundField HeaderText="Trabajador" DataField="trabajador" InsertVisible="False" ReadOnly="True" SortExpression="trabajador" />
                <asp:BoundField HeaderText="Usuario" DataField="usuario" InsertVisible="False" ReadOnly="True" SortExpression="usuario" />
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
            SelectCommand="SELECT Prestamo.idPrestamo, Prestamo.fecha, Prestamo.fechaEntrega, Prestamo.observacion, Prestamo.estado, tipoPrestamo.descripcion as tipoPrestamo, Producto.nombre as producto, Trabajador.nombre as trabajador, Usuario.nombre as usuario FROM Prestamo 
                                JOIN tipoPrestamo ON Prestamo.idtipoPrestamo = tipoPrestamo.idtipoPrestamo
                                JOIN Producto ON Prestamo.idProducto = Producto.idProducto
                                JOIN Trabajador ON Prestamo.idTrabajador = Trabajador.idTrabajador
                                JOIN Usuario ON Prestamo.idUsuario = Usuario.idUsuario;"
            DeleteCommand="DELETE FROM [Prestamo] WHERE [idPrestamo] = @idPrestamo"
            UpdateCommand="UPDATE [Usuario] SET [rut] = @rut, [nombre] = @nombre, [apellidoP] = @apellidoP, [apellidoM] = @apellidoM, [fechaDeIngreso] = @fechaDeIngreso, [clave] = @clave WHERE [idUsuario] = @idUsuario">
            <DeleteParameters>
                <asp:Parameter Name="idPrestamo" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="observacion" Type="String" />
                <asp:Parameter Name="estado" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </asp:Panel>
    <div class="form-row">
        <div class="col-md-10">
        </div>
        <div class="col-md-2">
            <br>
            <br>
            <asp:Button Text="PDF" runat="server" CssClass="btn btn-block btn-danger" ID="ButtonPDF" OnClick="btnPDF_Click" />
        </div>
    </div>

</asp:Content>
