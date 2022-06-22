<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="Especialidades.aspx.cs" Inherits="TurnosAppWeb.Especialidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <div>
      

        <div class="center-grid default">
        <div class="container">
              <div class="mb-3">
                    <asp:Button ID="btnbuscar" runat="server" Text="Buscar Especialidad" CssClass="btn btn-primary m-2 " onclick="btnbuscar_Click" />
                    <asp:TextBox runat="server" ID="txtbuscar" CssClass="form-control px-lg-3"/>     
            </div>  



            <div class="col-md-7">

        <asp:GridView ID="listaespecialidades" runat="server" cssClass="table table-dark" AutoGenerateColumns="false" OnSelectedIndexChanged="listaespecialidades_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="id" />
                <asp:BoundField HeaderText="Descripción" DataField="descripcion" />
                
                <asp:CommandField ShowSelectButton="true" SelectText="Editar" HeaderText="Accion" />

            </Columns>
            
            
        </asp:GridView>
            </div>
            </div>
            </div>
            

    </div>


</asp:Content>
