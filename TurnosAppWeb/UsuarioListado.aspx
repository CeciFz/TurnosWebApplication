<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="UsuarioListado.aspx.cs" Inherits="TurnosAppWeb.UsuarioListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="mb-2">
            <asp:Button ID="btnbuscar" runat="server" Text="Buscar Contacto: DNI" CssClass="btn btn-primary m-2 " OnClick="btnbuscar_Click" />
            <asp:TextBox runat="server" ID="txtbuscaru" CssClass="form-control" />
        </div>
        <div class="row col-md-12 justify-content-center">
            <asp:GridView ID="dgvlistaUsuarios" runat="server" DataKeyNames="id" OnSelectedIndexChanged="listacontactos_SelectedIndexChanged" CssClass="table table-dark table-borderer" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Apellidos" DataField="apellidos" />
                    <asp:BoundField HeaderText="Nombres" DataField="nombres" />
                    <asp:BoundField HeaderText="Fecha de Nacimiento" DataField="fechaNacimiento" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="Sexo" DataField="sexo" />
                    <asp:BoundField HeaderText="Tipo de documento" DataField="tipoDocumento.descripcion" />
                    <asp:BoundField HeaderText="Nro de Documento" DataField="nroDocumento" />
                    <asp:BoundField HeaderText="Telefono" DataField="telefono" />
                    <asp:BoundField HeaderText="Mail" DataField="mail" />
                    <asp:BoundField HeaderText="Obra social" DataField="obraSocial.descripcion" />
                    <asp:BoundField HeaderText="Fecha de alta" DataField="fechaAlta" />
                    <asp:CommandField HeaderText="Acción" SelectText="Editar" ShowSelectButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
