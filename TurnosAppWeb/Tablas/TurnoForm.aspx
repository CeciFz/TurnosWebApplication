<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="TurnoForm.aspx.cs" Inherits="TurnosAppWeb.TurnoForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container col-md-6 px-4">
        <div class="card border-secondary">
            <div class="card-header">
                <h4 class="fw-bold">Nuevo Turno</h4>
            </div>
            <div class="card-body">
                <asp:Label ID="lblDatosPaciente" runat="server" Text="Datos Paciente" CssClass="fw-bold d-inline-flex fs-5 p-1"></asp:Label>
                <div class="col my-2 d-flex justify-content-start align-items-baseline gap-4">
                    <asp:Label ID="lblFiltro" CssClass="form-label p-1" runat="server" Text="Filtro: "></asp:Label>
                    <asp:TextBox runat="server" ID="txtbuscarPaciente" CssClass="form-label" />
                    <asp:Button ID="btnbuscarPaciente" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnbuscarPaciente_Click" />
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="col">
                            <label for="ddlPaciente" class="form-label p-1">Paciente: </label>
                            <asp:DropDownList runat="server" ID="ddlPaciente" CssClass="form-check-inline p-1" OnSelectedIndexChanged="ddlPaciente_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:Label runat="server" ID="lblNroDoc" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <hr />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="d-flex flex-column gap-1">
                            <asp:Label ID="lblTurnoTomado" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4 text-center" Text=" ⚠️ Turno no agendado: el paciente ya posee otro turno ese día y horario" Visible="false"></asp:Label>
                                <asp:Label ID="lblTurnoRepetido" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4 text-center" Text=" ⚠️ El paciente ya posee otro turno agendado con este profesional ¿Desea Continuar?" Visible="false"></asp:Label>
                            <div class="d-flex justify-content-center gap-4">
                                <asp:Button Text="Aceptar" runat="server" CssClass="btn btn-primary" ID="btnAceptar" OnClick="btnAceptar_Click" Visible="false" />
                                <asp:Button Text="Cancelar" runat="server" CssClass="btn btn-primary" ID="btnCancelar" OnClick="btnCancelar_Click" Visible="false" />
                            </div>
                            <asp:Label ID="lblTurno" runat="server" Text="Datos Turno" CssClass="fw-bold d-inline-flex fs-5 p-1"></asp:Label>
                            <div class="col d-flex align-items-baseline gap-1">
                                <asp:Label CssClass="form-label p-1" ID="lblEspecialidad" runat="server" Text="Especialidades: "></asp:Label>
                                <asp:DropDownList ID="ddlEspecialidad" CssClass="form-check-inline p-1" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="col d-flex align-items-baseline gap-1">
                                <asp:Label ID="lblProfesional" CssClass="form-label p-1" runat="server" Text="Profesionales: "></asp:Label>
                                <asp:DropDownList ID="ddlProfesionales" CssClass="form-check-inline p-1" AutoPostBack="true"
                                    runat="server" OnSelectedIndexChanged="ddlProfesionales_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="col d-flex align-items-baseline gap-1">
                                <asp:Label ID="lblDias" runat="server" CssClass="form-label p-1" Text="Día: "></asp:Label>
                                <asp:DropDownList ID="ddlDias" CssClass="form-check-inline p-1" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlDias_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="col d-flex align-items-baseline gap-1">
                                <asp:Label ID="lblTurnosDisponibles" runat="server" CssClass="form-label p-1" Text="Turnos Disponibles: "></asp:Label>
                                <div class=" d-inline-flex">
                                    <asp:DropDownList ID="ddlFecha" CssClass="form-check-inline p-1" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlFecha_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlHora" CssClass="form-check-inline p-1" runat="server" AutoPostBack="true">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col text-center">
                                <asp:Label ID="lblSinTurno" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4" Text=" ⚠️ Agenda completa" Visible="false"></asp:Label>
                            </div>
                            <div class="col d-flex align-items-baseline gap-1">
                                <asp:Label ID="lblObservaciones" runat="server" CssClass="form-check-inline p-1 " Text="Observaciones:"></asp:Label>
                                <asp:TextBox ID="txtObservaciones" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button Text="Agendar" runat="server" CssClass="btn btn-primary" ID="btnAgendar" OnClick="btnAgendar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
    <%--  <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        Launch static backdrop modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">⚠️ Atención: </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    El paciente ya posee un turno agendado con este profesional. 
                    ¿Desea continuar?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Understood</button>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
