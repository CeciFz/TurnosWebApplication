<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TurnosAppWeb._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    
    

    <div class="hero p-4 p-md-5 mb-2 text-white">
        <div class="col-md-12 d-flex flex-column justify-content-center">
            <h1 class="display-4 align-self-center">TURNOS</h1>
            <p class="lead my-3 align-self-center">Por favor loguearse para poder ingresar al sistema de turnos.</p>
            <p class="lead mb-0 align-self-center text-center">Si es la primera vez que va a solicitar atención en nuestra institución primero deberá registrar sus datos y generar su usuario.</p>
        </div>
    </div>
    <div class="col-md-5 px-4 pb-4 container">
        <div class="row mb-3">
            <asp:Label Text="Usuario o contraseña invalida" ID="lblerror" CssClass="lead my-3 align-self-center" Visible="false" runat="server" />
            <label class="col-sm-2 col-form-label">Usuario</label>
            <div class="col-sm-10">
                <asp:TextBox ID="TextUser" placeholder="user name" CssClass="form-control"  runat="server"></asp:TextBox>
                
            </div>
        </div>
        <div class="row mb-3">
            <label  class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
                <asp:TextBox ID="Textpassword" placeholder="*****" CssClass="form-control" runat="server"></asp:TextBox>
                
            </div>
        </div>
        <div class="d-flex justify-content-center">
            
            <asp:Button class="btn btn-primary m-2" ID="btnIniciarSesion" OnClick="btnIniciarSesion_Click" runat="server" Text="Iniciar sesión" />
            <asp:Button class="btn btn-primary m-2" ID="btnResgistrarse" OnClick="btnResgistrarse_Click" runat="server" Text="Registrarse" />
        </div>
    </div>
</asp:Content>

