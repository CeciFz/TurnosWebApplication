﻿<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="EstadoTurnoForm.aspx.cs" Inherits="TurnosAppWeb.Tablas.EstadoTurnoForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row col-md-6 justify-content-center">
        <% if (btnModificar.Visible == false)
            {  %>
        <h1 class="align-self-center">Registrar nuevo Estado Turno</h1>
        <% }
            else
            {  %>
        <h1 class="align-self-center">Modificar Estado Turno</h1>
        <% } %>
        <div class="mb-3">
            <label for="txtId" class="form-label">Id</label>
            <asp:TextBox runat="server" ID="txtId" CssClass="form-control" ReadOnly="true" />
        </div>
        <div class="mb-3">
            <label for="txtDescripcion" class="form-label">Nombre Estado Turno</label>
            <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
        </div>
        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary m-2" />
        <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" CssClass="btn btn-primary m-2" Visible="false" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" CssClass="btn btn-primary m-2" Visible="false" />
    </div>
</asp:Content>
