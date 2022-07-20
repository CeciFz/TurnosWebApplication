<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="PanelTurnosGeneral.aspx.cs" Inherits="TurnosAppWeb.Gestion.PanelTurnosGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-md-12 ">
        <div class="col-md-10 my-2 text-center">
            <h1>Gestión de Turnos </h1>
        </div>
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
        </div>
        <div class="col-md-5 d-flex flex-column gap-4">

            <div class="col-md-12 px-4">
                <asp:Repeater runat="server" ID="repDetalleTurno">
                    <ItemTemplate>
                        <div class="card border-secondary ">
                            <div class="card-header">
                                <h5 class="card-title">Turno: <%#Eval("fecha", "{0: dd/MM/yyyy}") %> - <%#Eval("hora") %></h5>
                                <asp:Label ID="lblEspecialidad" CssClass="form-label p-1" runat="server"></asp:Label>
                            </div>
                            <div class="card-body d-flex flex-column">
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
                                        <div class="d-flex flex-column gap-1">
                                            <asp:Label ID="lblTurnoTomado" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4 text-center" Text=" ⚠️ Turno no agendado: el paciente ya posee otro turno ese día y horario" Visible="false"></asp:Label>
                                            <asp:Label ID="lblTurnoRepetido" runat="server" CssClass="form-check-inline p-2 text-bg-secondary rounded-4 text-center" Text=" ⚠️ El paciente ya posee otro turno agendado con este profesional ¿Desea Continuar?" Visible="false"></asp:Label>
                                            <div class="d-flex justify-content-center gap-4">
                                                <asp:Button Text="Aceptar" runat="server" CssClass="btn btn-primary" ID="btnAceptar" OnClick="btnAceptar_Click" Visible="false" />
                                                <asp:Button Text="Cancelar" runat="server" CssClass="btn btn-primary" ID="btnCancelar" OnClick="btnCancelar_Click" Visible="false" />
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
                                            <div class="col">
                                                <label for="txtObservaciones" class="form-label">Observaciones:</label>
                                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtObservaciones" CssClass="form-control" />
                                            </div>
                                            <asp:Button Text="Modificar" runat="server" CssClass="btn btn-primary" ID="btnReAgendar" OnClick="btnReAgendar_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>



                                <%--                            /***************/--%>

                                <asp:Button Text="Guardar cambios" runat="server" CssClass="btn btn-primary mt-3 align-self-center" ID="btnModificar" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnModificar_Click" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-12 px-4">
                <asp:Repeater runat="server" ID="repPaciente">
                    <ItemTemplate>
                        <div class="card border-secondary">
                            <div class="card-header">
                                <h5 class="card-title">Paciente: <%#Eval("apellidos") %>, <%#Eval("nombres") %> </h5>
                            </div>
                            <div class="card-body p-4">
                                <p class="d-flex justify-content-between">
                                    <label class="card-text">Fecha de nac.: <%#Eval("fechaNacimiento", "{0: dd/MM/yyyy}")%> </label>
                                    <label class="card-text">Edad: <%#Eval("edad")%> años</label>
                                </p>
                                <p class="d-flex justify-content-between">
                                    <label class="card-text">Género: <%#Eval("sexo")%> </label>
                                    <label class="card-text">Obra Social: <%#Eval("obrasocial.descripcion")%> </label>
                                    <p class="d-flex ">
                                        <label class="card-text me-2"><%#Eval("tipoDocumento.descripcion")%>: </label>
                                        <label class="card-text"><%#Eval("nroDocumento")%> </label>
                                    </p>
                                </p>
                                <p class="card-text">Teléfono: <%#Eval("telefono")%> </p>
                                <p class="card-text">Mail: <%#Eval("mail")%> </p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        </div>
</asp:Content>
