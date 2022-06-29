<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="EstadoTurnoListado.aspx.cs" Inherits="TurnosAppWeb.Tablas.EstadoTurnoListado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-4">
        <asp:GridView ID="dgvlistaEstadosTurnos" DataKeyNames="id" runat="server" CssClass="table table-dark" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvlistaEstadosTurnos_SelectedIndexChanged"   >
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="id" />
                <asp:BoundField HeaderText="Descripcion" DataField="descripcion" />
                <asp:CommandField HeaderText="Editar" SelectText="Editar" ShowSelectButton="true" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
