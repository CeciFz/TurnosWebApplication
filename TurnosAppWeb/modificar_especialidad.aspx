<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="modificar_especialidad.aspx.cs" Inherits="TurnosAppWeb.modificar_especialidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="center-grid default">
        <div class="container">
            <br />
            <br />
            <div class="row col-md-6 justify-content-center">
                <h1 class="align-self-center"> Modificar Especialidad seleccionada</h1>
                <br />
                <br />
                    <label for="txtid" class="form-label">ID Especialidad</label>
                    <asp:TextBox runat="server" id="txtid" CssClass="form-control"/>
                
                <br />
                    <label for="txtDescripcion" class="form-label">Modificar Nombre Especialidad</label>
                    <asp:TextBox runat="server" id="Txtdescripcione" CssClass="form-control"/>
                </div>
                <asp:Button ID="btnModificare" runat="server" Text="Modificar" OnClick="btnModificare_Click" CssClass="btn btn-primary m-2" Visible="true" />
                
            </div>
        
    </div> 


</asp:Content>
