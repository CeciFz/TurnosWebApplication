<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="listados.aspx.cs" Inherits="TurnosAppWeb.listados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="center-grid default">
        <div class="container">
            <div class="row col-md-6 justify-content-center">
                
               <asp:Label ID="lblTipoDoc" runat="server" Text="Tipos de Documento"></asp:Label>
               <asp:GridView ID="listaTiposDocumentos" runat="server" ></asp:GridView>

                <hr />  
                    <asp:Label ID="lblObSoc" runat="server" Text="Obras Sociales"></asp:Label>
                    <asp:GridView ID="listaObrasSociales" runat="server" ></asp:GridView>

                <hr />
                    <asp:Label ID="lblPerfUs" runat="server" Text="Perfiles Usuarios"></asp:Label>
                    <asp:GridView ID="listaPerfilesUsuarios" runat="server" ></asp:GridView>

                <hr />
                    <asp:Label ID="lblEstTurnos" runat="server" Text="Estados Turnos"></asp:Label>
                    <asp:GridView ID="listaEstadosTurnos" runat="server" ></asp:GridView>
            </div>
        </div>
    </div>    

</asp:Content>
