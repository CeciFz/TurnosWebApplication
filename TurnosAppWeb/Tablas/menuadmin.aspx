<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="menuadmin.aspx.cs" Inherits="TurnosAppWeb.Tablas.menuadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1  style="color:brown; align-content:center">MENU PRINCIPAL ADMINISTRADOR</h1>
    <br /><br />

    <div>
        <div class="row">
  <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title">NUEVO TURNO</h5>
        <p class="card-text">Ingrese un nuevo turno al paciente</p>
        <div class="d-grid gap-2 col-6 mx-auto">
              <a href="../Tablas/TurnoForm.aspx" class="btn btn-primary">Ingresar</a>
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

</asp:Content>
      

