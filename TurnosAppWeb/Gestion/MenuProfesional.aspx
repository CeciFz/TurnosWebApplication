<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="MenuProfesional.aspx.cs" Inherits="TurnosAppWeb.Tablas.menuprofesional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <h5>MENU profesional , solo acceso a datos de sus turnos y modificar el estado del turno.</h5>
    <br />
    <br />
    <br />

    <asp:Label ID="lblSeleccionEsp" runat="server" Text="Seleccione la especialidad a la que desea acceder:" CssClass="fw-bold d-inline-flex fs-5 p-1"></asp:Label>
    <asp:Repeater ID="repSeleccionEspecialidad" runat="server">
        <ItemTemplate>
            <asp:Button Text='<%#Eval("descripcion")%>' CommandArgument='<%#Eval("id")%>' CommandName="id" OnClick="btnEspecialidad_Click" runat="server" CssClass="btn btn-primary mx-4 mb-3" ID="btnEspecialidad" />
        </ItemTemplate>
    </asp:Repeater>
        <a href="/Gestion/PanelTurnosProfesional.aspx">Gestionar turnos</a>
</asp:Content>
