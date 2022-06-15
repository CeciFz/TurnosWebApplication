<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="TurnosApp.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <h3>mostramos las especialidades que contamos; ejemplo clinico medico,CARDIOLOGO</h3>

    <asp:GridView ID="dgvEspecialidades" runat="server"></asp:GridView>
</asp:Content>
