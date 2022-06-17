<%@ Page Title="" Language="C#" MasterPageFile="~/paginamaestra.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="WebApplication1.contactos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div>
        <asp:GridView ID="listacontactos" runat="server" ></asp:GridView>
    </div>

</asp:Content>
