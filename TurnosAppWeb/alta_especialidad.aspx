﻿<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="alta_especialidad.aspx.cs" Inherits="TurnosAppWeb.alta_especialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="center-grid default">
        <div class="container">
            <br />
            <br />
            <div class="row col-md-6 justify-content-center">
                <h1 class="align-self-center">Registrar nueva Especialidad</h1>
                <br />
                <br />
                    <label for="txtDescripcion" class="form-label">Nombre Especialidad</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control"/>
                </div>
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" onclick="btnRegistrar_Click" CssClass="btn btn-primary m-2" />
                
            </div>
        
    </div> 


</asp:Content>