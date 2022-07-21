<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="MenuProfesional.aspx.cs" Inherits="TurnosAppWeb.Tablas.MenuProfesional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />
    <br /><br />
   <div class ="now">

        <div class="col-9"> <h1 class="t_grafica"  style="color:Highlight; text-align: center"><asp:Image ImageUrl="https://cdn-icons.flaticon.com/png/512/3212/premium/3212997.png?token=exp=1658195147~hmac=75f47cd9050ebd1fae56c47cc0353df1" CssClass="w-25" runat="server" />Menu-Profesional</h1> </div>

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
        <h5 class="card-title"> Pacientes </h5>
        <p class="card-text">turno de paciente</p>
       <div class="d-grid gap-2 col-6 mx-auto">

           <asp:Label ID="lblSeleccionEsp" runat="server" Text="Especialidad :" CssClass="fw-bold d-inline-flex fs-5 p-1"></asp:Label>
    <asp:Repeater ID="repSeleccionEspecialidad" runat="server">
        <ItemTemplate>
           <asp:Button Text='<%#Eval("descripcion")%>' CommandArgument='<%#Eval("id")%>' CommandName="id" OnClick="btnEspecialidad_Click" runat="server" CssClass="btn btn-primary mx-4 mb-3" ID="btnEspecialidad" />
        </ItemTemplate>
             </asp:Repeater>
           <%//   <a href="./PanelTurnosGeneral.aspx" class="btn btn-primary">Ingresar</a>   %>
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
