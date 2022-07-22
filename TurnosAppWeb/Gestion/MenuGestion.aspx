<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="MenuGestion.aspx.cs" Inherits="TurnosAppWeb.Tablas.MenuGestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class ="now">
        <div class="col-9"> <h1 class="t_grafica"  style="color:Highlight; text-align: center"><asp:Image ImageUrl="https://cdn-icons.flaticon.com/png/512/3212/premium/3212997.png?token=exp=1658195147~hmac=75f47cd9050ebd1fae56c47cc0353df1" CssClass="w-25" runat="server" />Menu-Gestión</h1> </div>

        <div class="col-15" style="width:auto; text-align: center">




    
    <br /><br />

    <div style="margin:0 auto;">
        <div class="row">
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">NUEVO TURNO</h5>
        <p class="card-text">Ingrese un nuevo turno al paciente</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/TurnoForm.aspx" class="btn btn-primary" >Ingresar</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">MODIFICAR TURNO</h5>
        <p class="card-text">Modificar turno a paciente</p>
       <div class="d-grid gap-2 col-6 mx-auto">
              <a href="./PanelTurnosGeneral.aspx" class="btn btn-primary">Ingresar</a>
        </div>
      </div>
    </div>
  </div>
</div>
        <br />
<div class="row">
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">AGREGAR USUARIO</h5>
        <p class="card-text">Ingresar un nuevo usuario al sistema</p>
       <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/UsuarioForm.aspx" class="btn btn-primary">Ingresar</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">MODIFICAR USUARIO</h5>
        <p class="card-text">Modificar usuario registrado</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/UsuarioListado.aspx" class="btn btn-primary">Ingresar</a>
            </div>
        </div>
    </div>
  </div>
</div>
    <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">PROFESIONALES</h5>
        <p class="card-text">Ver/modificar profesional registrado</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/ProfesionalListado.aspx" class="btn btn-primary">Ingresar</a>
            </div>
        </div>
    </div>
  </div>
</div>          

        <br />

    </div>

          

        <div class="col-2"> </div>

        </div>
        </div>


   
</asp:Content>
