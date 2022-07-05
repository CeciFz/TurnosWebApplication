<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="UsuarioForm.aspx.cs" Inherits="TurnosAppWeb.UsuarioForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row col-md-12">
        <% if (btnModificar.Visible == false)
            {  %>
        <h1 class="text-center mb-4">Registrar nuevo Usuario</h1>
        <% }
            else
            {  %>
        <h1 class="text-center mb-4">Modificar Usuario</h1>
        <% } %>
        <div class="row row-cols-3 mb-3">
            <div class="col">
                <label for="txtApellidos" class="form-label">Apellidos</label>
                <asp:TextBox runat="server" ID="txtApellidos" CssClass="form-control" />
            </div>
            <div class="col">
                <label for="txtNombres" class="form-label">Nombres</label>
                <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control" />
            </div>
            <div class="col">
                <label for="ddlSexo" class="form-label">Sexo</label>
                <asp:DropDownList runat="server" ID="ddlSexo" class="form-select">
                    <asp:ListItem Text="F" />
                    <asp:ListItem Text="M" />
                    <asp:ListItem Text="O" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="row row-cols-3 mb-3">
            <div class="col">
                <label for="ddlTipoDocumento" class="form-label">Tipo de documento</label>
                <asp:DropDownList runat="server" ID="ddlTipoDocumento" class="form-select"></asp:DropDownList>
            </div>
            <div class="col">
                <label for="txtNroDocumento" class="form-label">Número de documento</label>
                <asp:TextBox runat="server" ID="txtNroDocumento" CssClass="form-control" />
            </div>
            <div class="col">
                <label for="txtFecha" class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" ID="txtFechaNac" TextMode="Date" CssClass="form-control" />
            </div>
        </div>
        <div class="row row-cols-3 mb-3">
            <div class="col">
                <label for="txtTelefono" class="form-label">Teléfono</label>
                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
            </div>
            <div class="col">
                <label for="txtMail" class="form-label">Mail</label>
                <asp:TextBox runat="server" TextMode="Email" ID="txtMail" CssClass="form-control" />
            </div>
            <div class="col">
                <label for="ddlObraSocial" class="form-label">ObraSocial</label>
                <asp:DropDownList runat="server" ID="ddlObraSocial" class="form-select"></asp:DropDownList>
            </div>
        </div>
        <div class="row row-cols-3 mb-2">
            <div class="col">
                <label for="ddlPerfilusuario" class="form-label">Tipo usuario</label>
                <asp:DropDownList runat="server" ID="ddlPerfilusuario" class="form-select"></asp:DropDownList>
            </div>
        </div>
        <div class="row row-cols-3 justify-content-end">
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary" />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" CssClass="btn btn-primary" Visible="false" />
        </div>
    </div>

</asp:Content>
