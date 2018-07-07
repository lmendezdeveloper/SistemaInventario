<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SistemaInventario.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/dashboard.css" rel="stylesheet" />
    <link href="css/signin.css" rel="stylesheet" />
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body class="text-center">
    <form class="form-signin" id="form1" runat="server">
        <h1 class="h3 mb-3 font-weight-normal">Sistema Inventario</h1>
        <br>
        <asp:TextBox ID="txtUser" runat="server" Placeholder="Rut" CssClass="form-control"></asp:TextBox>
        <br>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Placeholder="Contraseña" CssClass="form-control"></asp:TextBox>
        <br>
        <asp:Button Text="Ingresar" runat="server" CssClass="btn-lg btn-primary btn-block" ID="btnIngresar" OnClick="btnIngresar_Click" />
        <%--<p class="mt-5 mb-3 text-muted">&copy; Luis Méndez - Rodrigo Manriquez</p>--%>
    </form>
</body>
</html>

