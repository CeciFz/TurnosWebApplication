<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="menuadmin.aspx.cs" Inherits="TurnosAppWeb.Tablas.menuadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="hero p-4 p-md-5 mb-2 text-white">

        <div class="col-md-12 d-flex flex-column justify-content-center">
            <h1 class="display-4 align-self-center">MENU PRINCIPAL</h1>
            <br /><br /><br /><br />
            <h3 class="display-4 align-self-center"> <asp:Image ImageUrl="https://cdn.icon-icons.com/icons2/714/PNG/512/profile_icon-icons.com_62220.png" CssClass="w-25" runat="server" />Administrador</h3>
           </div>
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
              <a href="../Tablas/TurnoListado.aspx" class="btn btn-primary">Ingresar</a>
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
                <br />
<div class="row">
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">AGREGAR OBRA SOCIAL</h5>
        <p class="card-text">Ingresar una nueva obra social al sistema</p>
       <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/ObraSocialForm.aspx" class="btn btn-primary">Ingresar</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">MODIFICAR OBRA SOCIAL</h5>
        <p class="card-text">Modificar obra social existente</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/ObraSocialListado.aspx" class="btn btn-primary">Ingresar</a>
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
        <h5 class="card-title">AGREGAR ESPECIALIDAD</h5>
        <p class="card-text">Ingresar una nueva especialidad de profesional</p>
       <div class="d-grid gap-2 col-6 mx-auto">
              <a href="#" class="btn btn-primary">Ingresar</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">MODIFICAR ESPECIALIDAD</h5>
        <p class="card-text">Modificar especialidad de profesionales existente</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/EspecialidadListado.aspx" class="btn btn-primary">Ingresar</a>
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
        <h5 class="card-title">ALTA ESTADO DE TURNO</h5>
        <p class="card-text">Ingresar un nuevo estado de turnos</p>
       <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/EstadoTurnoForm.aspx" class="btn btn-primary">Ingresar</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">MODIFICAR ESTADO DE TURNO</h5>
        <p class="card-text">Modificar estado de turno existente</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/EstadoTurnoListado.aspx" class="btn btn-primary">Ingresar</a>
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
        <h5 class="card-title">AGREGAR TIPO DE DOCUMENTO</h5>
        <p class="card-text">Ingresar un nuevo tipo de documento</p>
       <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/TipoDocumentoForm.aspx" class="btn btn-primary">Ingresar</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">MODIFICAR TIPO DE DOCUMENTO</h5>
        <p class="card-text">Modificar tipo de documento existente</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/TipoDocumentoListado.aspx" class="btn btn-primary">Ingresar</a>
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
        <h5 class="card-title">AGREGAR TIPO DE PERFIL</h5>
        <p class="card-text">Ingresar un nuevo tipo de perfil de usuario</p>
       <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/PerfilUsuarioForm.aspx" class="btn btn-primary">Ingresar</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-4" >
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">MODIFICAR TIPO DE PERFIL</h5>
        <p class="card-text">Modificar tipo de perfil de usuario existente</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/PerfilUsuarioListado.aspx" class="btn btn-primary">Ingresar</a>
            </div>
        </div>
    </div>
  </div>
</div>



    </div>

            </div>

        <div class="col-2"> </div>

        </div>

</asp:Content>
      

