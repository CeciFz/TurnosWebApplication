<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="MenuPaciente.aspx.cs" Inherits="TurnosAppWeb.Tablas.MenuPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />

    
     <br /><br />
    <br /><br />
   <div class ="now">

        <div class="col-9"> <h1 class="t_grafica"  style="color:Highlight; text-align: center"><asp:Image ImageUrl="https://th.bing.com/th/id/OIP.GJW1WLaj4qVVrr-UmFyvZwEsCd?pid=ImgDet&rs=1" CssClass="w-25" runat="server" />Menu-Paciente</h1> </div>

        <div class="col-15" style="width:auto; text-align: center">

            

            <br /><br />
    <br /><br />
    <br /><br />

    <div style="margin:0 auto;">
        <div class="row">
  
        <br />
  <br />

          <div class="col-sm-4">
    <div class="card border-light mb-3" style="max-width: 18rem;">
      <div class="card-body">
        <h5 class="card-title"> Turnos </h5>
        <p class="card-text">Agende su turno </p>
       <div class="d-grid gap-2 col-6 mx-auto">

         
          <a href="./PanelTurnosPaciente.aspx" class="btn btn-primary">Mis Turnos</a> 
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
