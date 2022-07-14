<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="TurnoListado.aspx.cs" Inherits="TurnosAppWeb.Tablas.TurnoListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 d-flex">
        <div class="col-md-6">
            <asp:GridView OnPageIndexChanging="dgvlistaTurnos_PageIndexChanging" ID="dgvlistaTurnos" runat="server" DataKeyNames="id" OnSelectedIndexChanged="dgvlistaTurnos_SelectedIndexChanged" CssClass="table thead-light table-borderer table-sm table-hover" AutoGenerateColumns="false" AllowPaging="True" AllowCustomPaging="False" PageSize="20">
                <Columns>
                    <asp:BoundField HeaderText="#" DataField="id" />
                    <asp:BoundField HeaderText="Paciente" DataField="paciente.nombres" />
                    <asp:BoundField HeaderText="Especialidad" DataField="especialidad.descripcion" />
                    <asp:BoundField HeaderText="Profesional" DataField="profesional.nombres" />
                    <asp:BoundField HeaderText="Fecha" DataField="fecha" />
                    <asp:BoundField HeaderText="Hora" DataField="hora" />
                    <asp:BoundField HeaderText="Estado" DataField="estado.descripcion" />
                    <asp:CommandField HeaderText="" SelectText="Modificar" ShowSelectButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
