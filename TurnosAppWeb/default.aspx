<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TurnosAppWeb._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-grid default">
        <div class="hero p-4 p-md-5 mb-4 text-white">
            <div class="col-md-12 d-flex flex-column justify-content-center">
                <h1 class="display-4 align-self-center">TURNOS</h1>
                <p class="lead my-3 align-self-center">Por favor loguearse para poder ingresar al sistema de turnos.</p>
                <p class="lead mb-0 align-self-center">Si es la primera vez que va a solicitar atención en nuestra institución primero deberá registrar sus datos y generar su usuario.</p>
            </div>
        </div>
        <div class="col-md-4 p-4 container">   
            <div class="row mb-3">
                <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="inputEmail3">
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3">
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <asp:Button class="btn btn-primary m-2" ID="btnIniciarSesion" runat="server" Text="Iniciar sesión" />
                <asp:Button class="btn btn-primary m-2" ID="btnResgistrarse" runat="server" Text="Registrarse" />
            </div>
        </div>
    </div>
</asp:Content>

