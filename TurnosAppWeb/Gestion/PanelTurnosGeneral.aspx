<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="PanelTurnosGeneral.aspx.cs" Inherits="TurnosAppWeb.Gestion.PanelTurnosGeneral" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-md-12 container">
            <h1 class="text-center">Gestión de Turnos </h1>
        <hr />
    </div>
    <div class="col-md-12 d-flex gap-4 justify-content-center">
        <div class="col-md-7">
            <div class="card border-secondary">
                <div class="card-header">
                    <h5 class="card-title">
                        <asp:Label ID="lblUsuario" runat="server" />
                    </h5>
                </div>
                <div class="card-body">
                    <asp:Repeater runat="server" ID="repTurnos" OnItemDataBound="repTurnos_ItemDataBound">
                        <ItemTemplate>
                            <div class="card border-secondary">
                                <div class="card-header text-center">
                                    <asp:Label CssClass="card-title " Text="Fecha: " runat="server" />
                                    <asp:Label CssClass="card-title " ID="lblFecha" runat="server" />
                                </div>
                            </div>
                            <asp:GridView ID="dgvlistaTurnosGeneral" OnSelectedIndexChanged="dgvlistaTurnosGeneral_SelectedIndexChanged" DataKeyNames="id" runat="server" CssClass="table thead-light table-borderer table-sm table-hover mb-5" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField HeaderText="Hora" DataField="hora" DataFormatString="{0:hh\:mm}" />
                                    <asp:BoundField HeaderText="Paciente" DataField="paciente.nombres" />
                                    <asp:BoundField HeaderText="Profesional" DataField="profesional.nombres" />
                                    <asp:BoundField HeaderText="Especialidad" DataField="especialidad.descripcion" />
                                    <asp:BoundField HeaderText="Estado" DataField="estado.descripcion" />
                                    <asp:CommandField HeaderText="" SelectText="📝" ShowSelectButton="true" />
                                </Columns>
                            </asp:GridView>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>  <%--LISTA TURNOS--%>
        <%--SEPARACION--%>
        <%--SEPARACION--%>
        <div runat="server" id="DivTurnos" visible="false" class="col-md-4 d-flex flex-column gap-4">
            <div class="card border-secondary ">
                <div class="card-header">
                    <asp:Label ID="lblEspecialidad" CssClass="form-label p-1 text-bg-success" runat="server"></asp:Label>
                    <asp:Label runat="server" ID="lblTurno" CssClass="card-title "></asp:Label>
                </div>
                <div class="card-body">
                    <%--      <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="col">
                                            <label cssclass="card-text" for="ddlEstadoTurno" class="form-label">Asistencia: </label>
                                            <asp:Button Text="Asistió" runat="server" CssClass="btn btn-primary mx-4 mb-3" ID="btnAsistio" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnAsistio_Click" />
                                            <asp:Button Text="No asistió" runat="server" CssClass="btn btn-primary mb-3" ID="btnNoAsistio" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnAsistio_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>--%>
                    <%--                            /*****************/--%>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="d-flex flex-column gap-1 align-items-center">
                                <asp:Label ID="lblTurnoNoAgendado" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4 text-center" Text=" ⚠️ Turno no agendado: el paciente ya posee otro turno ese día y horario" Visible="false"></asp:Label>
                                <asp:Label ID="lblTurnoRepetido" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4 text-center" Text=" ⚠️ El paciente ya posee otro turno agendado con este profesional ¿Desea Continuar?" Visible="false"></asp:Label>
                                <div class="d-flex justify-content-center gap-4">
                                    <asp:Button Text="Aceptar" runat="server" CssClass="btn btn-primary" ID="btnAceptar" OnClick="btnAceptar_Click" Visible="false" />
                                    <asp:Button Text="Cancelar" runat="server" CssClass="btn btn-primary" ID="btnCancelar" OnClick="btnCancelar_Click" Visible="false" />
                                </div>
                                <div class="col d-flex align-items-baseline gap-1">
                                    <asp:Label ID="lblProfesional" CssClass="form-label p-1" runat="server" Text="Profesional: "></asp:Label>
                                    <asp:DropDownList ID="ddlProfesionales" CssClass="form-check-inline p-1" AutoPostBack="true"
                                        runat="server" OnSelectedIndexChanged="ddlProfesionales_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col d-flex align-items-baseline gap-1">
<%--                                    <asp:Label ID="lblDias" runat="server" CssClass="form-label p-1"></asp:Label>--%>
                                    <asp:DropDownList ID="ddlDias" CssClass="form-check-inline p-1" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlDias_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col d-flex align-items-baseline gap-1">
<%--                                    <asp:Label ID="lblTurnosDisponibles" runat="server" CssClass="form-label p-1"></asp:Label>--%>
                                    <div class=" d-inline-flex">
                                        <asp:DropDownList ID="ddlFecha" DataTextFormatString="{0: dd/MM/yyyy}" CssClass="form-check-inline p-1" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlFecha_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlHora" CssClass="form-check-inline p-1 mb-2" runat="server" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col text-center">
                                    <asp:Label ID="lblSinTurno" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4" Text=" ⚠️ Agenda completa" Visible="false"></asp:Label>
                                </div>
<%--                                <div class="col d-flex align-items-baseline gap-1">--%>
                                    <label for="txtObservaciones" class="p-1  align-self-start">Observaciones:</label>
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtObservaciones" CssClass="form-control" />
<%--                                </div>--%>
                            <asp:Button Text="Modificar" runat="server" CssClass="btn btn-primary mt-2" ID="btnReAgendar" OnClick="btnReAgendar_Click" />
                            </div>
                            <%--<asp:Button Text="Guardar cambios" runat="server" CssClass="btn btn-primary mt-3 align-self-center" ID="btnModificar" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnModificar_Click" />--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div> <%--DETALLE TURNO--%>
        <%--SEPARACION--%>
        <%--SEPARACION--%>
        <asp:Repeater runat="server" ID="repPaciente">
            <ItemTemplate>
                <div class="card border-secondary">
                    <div class="card-header">
                        <h5 class="card-title"><strong>Paciente: <%#Eval("apellidos") %>, <%#Eval("nombres") %> </strong></h5>
                        <label class="card-text me-2"><%#Eval("tipoDocumento.descripcion")%>: </label>
                        <label class="card-text"><%#Eval("nroDocumento")%> </label>
                    </div>
                    <div class="card-body p-4">

                        <p class="d-flex justify-content-between">
                            <label class="card-text">Fecha de nac.: <%#Eval("fechaNacimiento", "{0: dd/MM/yyyy}")%> </label>
                            <label class="card-text">Edad: <%#Eval("edad")%> años</label>
                        </p>
                        <p class="d-flex justify-content-between">
                            <label class="card-text">Género: <%#Eval("sexo")%> </label>
                            <label class="card-text">Obra Social: <%#Eval("obrasocial.descripcion")%> </label>
                        </p>
                        <p class="card-text">Teléfono: <%#Eval("telefono")%> </p>
                        <p class="card-text">Mail: <%#Eval("mail")%> </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>  <%--DETALLE PACIENTE--%>
 </div> <%--DIV DE TURNO + PACIENTE--%>
    </div>
</asp:Content>
