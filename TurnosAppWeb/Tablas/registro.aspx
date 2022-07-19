<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="TurnosAppWeb.Tablas.registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="now">
        <div class="col-2">
        </div>

        <div class="col-8">

            <div class="mb-3">
               <h1 style="align-content:center"> BIENVENIDO-</h1>
                 </div>
            <div class="mb-3">
                <label for="lbldni" class="form-label">DNI</label>
                <input type="text" class="form-control" id="dniregistrar">
                </div>

            <div class="mb-3">
                <label for="lblusuario" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="usuarioregistrar">
                </div>
               
              <div class="mb-3">
                <label for="lblcontraseña" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="passregistrar">
            </div>

            <div class="mb-3">
                <asp:Button ID="registrar" OnClick="registrar_Click" class="btn btn-primary m-2"  runat="server" Text="Registrarse" />
                </div>

        </div>

        <div class="col-2">
        </div>


    </div>



</asp:Content>
