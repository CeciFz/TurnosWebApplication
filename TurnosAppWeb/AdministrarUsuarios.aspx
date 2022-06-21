<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="AdministrarUsuarios.aspx.cs" Inherits="TurnosAppWeb.AdministrarUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-grid default">
        <div class="container">
            <div class="row col-md-6 justify-content-center">
                <h1 class="align-self-center">Registrar nuevo usuario</h1>
                <div class="mb-3">
                    <label for="txtApellidos" class="form-label">Apellidos</label>
                    <asp:TextBox runat="server" ID="txtApellidos" CssClass="form-control"/>
                </div>
                <div class="mb-3">
                    <label for="txtNombres" class="form-label">Nombres</label>
                    <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control"/>
                </div>
                <div class="mb-3">
                    <label for="txtFecha" class="form-label">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" ID="txtFecha" TextMode="Date" CssClass="form-control"/>
                </div>            
                <div class="mb-3">
                    <label for="ddlSexo" class="form-label">Sexo</label>
                    <asp:DropDownList runat="server" ID="ddlSexo" class="form-select">
                        <asp:ListItem Text="F" />
                        <asp:ListItem Text="M" />
                        <asp:ListItem Text="O" />
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlTipoDocumento" class="form-label">Tipo de documento</label>
                    <asp:DropDownList runat="server" ID="ddlTipoDocumento" class="form-select">
                        <asp:ListItem Text="Documento único" />
                        <asp:ListItem Text="Libreta cívica" />
                        <asp:ListItem Text="Libreta de enrolamiento" />
                        <asp:ListItem Text="Pasaporte" />
                        <asp:ListItem Text="Carnet de extranjería" />
                        <asp:ListItem Text="Otros" />
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="txtNroDocumento" class="form-label">Número de documento</label>
                    <asp:TextBox runat="server" ID="txtNroDocumento" CssClass="form-control"/>
                </div> 
                <div class="mb-3">
                    <label for="txtTelefono" class="form-label">Número de telefono</label>
                    <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control"/>
                </div> 
                <div class="mb-3">
                    <label for="txtMail" class="form-label">Mail</label>
                    <asp:TextBox runat="server" TextMode="Email" ID="txtMail" CssClass="form-control"/>
                </div> 
                <div class="mb-3">
                    <label for="ddlObraSocial" class="form-label">ObraSocial</label>
                    <asp:DropDownList runat="server" ID="ddlObraSocial" class="form-select">
                        <asp:ListItem Text="Pami" />
                        <asp:ListItem Text="Galeno" />
                        <asp:ListItem Text="Osde" />
                        <asp:ListItem Text="Osba" />
                        <asp:ListItem Text="Swiss Medical" />
                        <asp:ListItem Text="Uthgra" />
                        <asp:ListItem Text="Osdepym" />
                        <asp:ListItem Text="Ioma" />
                        <asp:ListItem Text="Accord" />
                        <asp:ListItem Text="Medicus" />
                    </asp:DropDownList>
                </div>
               
                <div class="mb-3">
                    <label for="ddl_perfilusuaio" class="form-label">Tipo usuario</label>
                    <asp:DropDownList runat="server" ID="DropDownList1" class="form-select">
                        <asp:ListItem Text="Admin" />
                        <asp:ListItem Text="Gestión" />
                        <asp:ListItem Text="Paciente" />
                        <asp:ListItem Text="Profesional" />                       
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary m-2 " />
            </div>
        </div>
    </div>
</asp:Content>
