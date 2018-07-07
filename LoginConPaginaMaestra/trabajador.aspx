<%@ Page Title="" Language="C#" MasterPageFile="~/MenuAdmin.Master" AutoEventWireup="true" CodeBehind="trabajador.aspx.cs" Inherits="SistemaInventario.trabajador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Gestión Trabajador</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-4">
            <br>
            <asp:Label Text="Nombre: " runat="server" />
            <asp:TextBox ID="txtNombre" runat="server" Placeholder="Nicolás" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Apellido Paterno: " runat="server" />
            <asp:TextBox ID="txtApellidoP" runat="server" Placeholder="Luco" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Apellido Materno: " runat="server" />
            <asp:TextBox ID="txtApellidoM" runat="server" Placeholder="Palomino" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Rut: " runat="server" />
            <asp:TextBox ID="txtRut" runat="server" Placeholder="12345678-9" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Fecha Inicio: " runat="server" />
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" PlaceHolder="dd/mm/aaaa"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Contrato: " runat="server" />
            <asp:DropDownList ID="dpContrato" runat="server" CssClass="form-control" DataSourceID="listContrato" DataTextField="descripcion"
                DataValueField="idContrato">
            </asp:DropDownList>
            <asp:SqlDataSource ID="listContrato" runat="server" ConnectionString="<%$ ConnectionStrings:inventarioConnectionString %>" SelectCommand="SELECT * FROM [Contrato]"></asp:SqlDataSource>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Clave: " runat="server" />
            <asp:TextBox ID="txtClave" TextMode="Password" runat="server" Placeholder="******" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <br>
            <asp:Label Text="Repita Clave: " runat="server" />
            <asp:TextBox ID="txtClave2" TextMode="Password" runat="server" Placeholder="******" CssClass="form-control"></asp:TextBox>
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
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataSourceID="inventario" DataKeyNames="idTrabajador" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:TemplateField HeaderText="RUT">
                        <ItemTemplate>
                            <asp:Label ID="lblEditRut" runat="server"><%# Eval("rut")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditRut" runat="server" Text='<%# Bind("rut")%>' CssClass="form-control"></asp:TextBox>
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
                    <asp:TemplateField HeaderText="Apellido Paterno">
                        <ItemTemplate>
                            <asp:Label ID="lblEditApellidoP" runat="server"><%# Eval("apellidoP")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditApellidoP" runat="server" Text='<%# Bind("apellidoP")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido Materno">
                        <ItemTemplate>
                            <asp:Label ID="lblEditApellidoM" runat="server"><%# Eval("apellidoM")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditApellidoM" runat="server" Text='<%# Bind("apellidoM")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha Inicio">
                        <ItemTemplate>
                            <asp:Label ID="lblEditFechaInicio" runat="server"><%# Eval("fechaInicio", "{0:d}") %></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditFechaInicio" runat="server" Text='<%# Bind("fechaInicio")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Clave">
                        <ItemTemplate>
                            <asp:Label ID="lblEditClave" runat="server"><%# Eval("clave")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditClave" runat="server" Text='<%# Bind("clave")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Contrato" DataField="descripcion" InsertVisible="False" ReadOnly="True" SortExpression="descripcion" />
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
                SelectCommand="SELECT Trabajador.idTrabajador, Trabajador.rut, Trabajador.nombre, Trabajador.apellidoP, Trabajador.apellidoM, Trabajador.clave, Trabajador.fechaInicio, Contrato.descripcion FROM Trabajador INNER JOIN Contrato ON Trabajador.idContrato = Contrato.idContrato;"
                DeleteCommand="DELETE FROM [Trabajador] WHERE [idTrabajador] = @idTrabajador"
                UpdateCommand="UPDATE [Trabajador] SET [rut] = @rut, [nombre] = @nombre, [apellidoP] = @apellidoP, [apellidoM] = @apellidoM, [fechaInicio] = @fechaInicio, [clave] = @clave WHERE [idTrabajador] = @idTrabajador">
                <DeleteParameters>
                    <asp:Parameter Name="idTrabajador" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="rut" Type="String" />
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="apellidoP" Type="String" />
                    <asp:Parameter Name="apellidoM" Type="String" />
                    <asp:Parameter Name="clave" Type="String" />
                    <asp:Parameter Name="fechaInicio" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
