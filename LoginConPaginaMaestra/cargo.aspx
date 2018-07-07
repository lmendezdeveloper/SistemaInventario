<%@ Page Title="" Language="C#" MasterPageFile="~/MenuAdmin.Master" AutoEventWireup="true" CodeBehind="cargo.aspx.cs" Inherits="SistemaInventario.cargo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Gestión Cargo</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-8">
            <br>
            <asp:Label Text="Descripción: " runat="server" />
            <asp:TextBox ID="txtNombre" runat="server" Placeholder="Descripción del cargo" CssClass="form-control"></asp:TextBox>
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
            <asp:GridView ID="gvCargo" runat="server" AutoGenerateColumns="False" DataSourceID="inventario" DataKeyNames="idCargo" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="idCargo" InsertVisible="False" ReadOnly="True" SortExpression="idCargo" />


                    <asp:TemplateField HeaderText="Descripción">
                        <ItemTemplate>
                            <asp:Label ID="lblEditDescripcion" runat="server"><%# Eval("descripcion")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDescripcion" runat="server" Text='<%# Bind("descripcion")%>' CssClass="form-control"></asp:TextBox>
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
                SelectCommand="SELECT *from Cargo;"
                DeleteCommand="DELETE FROM [Cargo] WHERE [idCargo] = @idCargo"
                UpdateCommand="UPDATE [Cargo] SET [descripcion] = @descripcion WHERE [idCargo] = @idCargo">
                <DeleteParameters>
                    <asp:Parameter Name="idCargo" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
