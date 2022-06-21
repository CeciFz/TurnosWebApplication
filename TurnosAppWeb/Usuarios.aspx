<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TurnosAppWeb.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-grid default">
        <div class="container">

            <div class="mb-2">
                    <asp:Button ID="btnbuscar" runat="server" Text="Buscar Contacto" CssClass="btn btn-primary m-2 " onclick="btnbuscar_Click" />
                    <asp:TextBox runat="server" ID="txtbuscar" CssClass="form-control"/>     
            </div> 
            <div class="row col-md-12 justify-content-center">
                <asp:GridView ID="listacontactos" runat="server" cssClass="table table-dark table-borderer" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Apellidos" DataField="apellidos" />
                        <asp:BoundField HeaderText="Nombres" DataField="nombres" />
                        <asp:BoundField HeaderText="Fecha de Nacimiento" DataField="fechaNacimiento" />
                        <asp:BoundField HeaderText="Sexo" DataField="sexo" />
                        <asp:BoundField HeaderText="Tipo de documento" DataField="tipoDocumento" />
                        <asp:BoundField HeaderText="Nro de Documento" DataField="nroDocumento" />
                        <asp:BoundField HeaderText="Telefono" DataField="telefono" />
                         <asp:BoundField HeaderText="Mail" DataField="mail" />
                        <asp:BoundField HeaderText="Obra social" DataField="obraSocial" />
                        <asp:BoundField HeaderText="Fecha de alta" DataField="fechaAlta" />
                         
                    </Columns>    
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
