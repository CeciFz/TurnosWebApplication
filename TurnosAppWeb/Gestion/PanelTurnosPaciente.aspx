<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="PanelTurnosPaciente.aspx.cs" Inherits="TurnosAppWeb.Gestion.PanelTurnosPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container col-md-8">
        <h1 class="text-center">Mis Turnos </h1>
        <hr />
        <div class="card border-secondary">
            <div class="card-header">
                <h5 class="card-title">
                    <asp:Label ID="lblPaciente" runat="server" />
                </h5>
            </div>
            <div class="card-body">
                <asp:GridView ID="dgvlistaTurnosPaciente" OnSelectedIndexChanged="dgvlistaTurnosPaciente_SelectedIndexChanged" DataKeyNames="id" runat="server" CssClass="table thead-light table-borderer table-sm table-hover mb-5" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField HeaderText="Hora" DataField="hora" DataFormatString="{0:hh\:mm}" />
                        <asp:BoundField HeaderText="Paciente" DataField="paciente.nombres" />
                        <asp:BoundField HeaderText="Profesional" DataField="profesional.nombres" />
                        <asp:BoundField HeaderText="Especialidad" DataField="especialidad.descripcion" />
                        <asp:BoundField HeaderText="Estado" DataField="estado.descripcion" />
                        <%--                                    <asp:CommandField HeaderText="" SelectText="📝" ShowSelectButton="true" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <asp:Button Text="Ver historial de Turnos" runat="server" ID="btnHistorial" OnClick="btnHistorial_Click" CssClass="btn btn-link my-4" />
            <div class="card border-secondary" runat="server" id="divHistorial" visible="false">
                <div class="card-header">
                    <h5 class="card-title">
                        <asp:Label ID="lbl" Text="Historial" runat="server" class="text-center" />
                    </h5>
                </div>
                <div class="card-body">
                    <asp:GridView ID="dgvlistaTurnosPacienteConH" runat="server" CssClass="table thead-light table-borderer table-sm table-hover mb-5" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField HeaderText="Hora" DataField="hora" DataFormatString="{0:hh\:mm}" />
                            <asp:BoundField HeaderText="Paciente" DataField="paciente.nombres" />
                            <asp:BoundField HeaderText="Profesional" DataField="profesional.nombres" />
                            <asp:BoundField HeaderText="Especialidad" DataField="especialidad.descripcion" />
                            <asp:BoundField HeaderText="Estado" DataField="estado.descripcion" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </>
    </div>
</asp:Content>

