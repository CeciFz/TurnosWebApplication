<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="PanelProfesional.aspx.cs" Inherits="TurnosAppWeb.PanelProfesional" %>

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
        <div class="col-md-6">
            <div class="card border-secondary">
                <div class="card-header">
                    <h5 class="card-title">
                        <asp:Label ID="lblProfesional" runat="server" />
                    </h5>
                    <h5 class="card-title">
                        <asp:Label ID="lblEspecialidad" runat="server" />
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
                            <asp:GridView ID="dgvlistaTurnosProfesional" OnSelectedIndexChanged="dgvlistaTurnosProfesional_SelectedIndexChanged" DataKeyNames="id" runat="server" CssClass="table thead-light table-borderer table-sm table-hover mb-5" AutoGenerateColumns="false">
                                <Columns>
                                    <%--<asp:BoundField HeaderText="IdTurno" DataField="id" />
                                    <asp:BoundField HeaderText="IdPaciente" DataField="paciente.id" />--%>
                                    <asp:BoundField HeaderText="Hora" DataField="hora" DataFormatString="{0:hh\:mm}" />
                                    <asp:BoundField HeaderText="Paciente" DataField="paciente.nombres" />
                                    <asp:BoundField HeaderText="Estado" DataField="estado.descripcion" />
                                    <asp:CommandField HeaderText="" SelectText="📝" ShowSelectButton="true" />
                                </Columns>

                            </asp:GridView>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div class="col-md-6 d-flex flex-column gap-4">
            <div class="col-md-12 px-4">
<%--                <div class="col d-flex justify-content-center gap-4">
                    <asp:Button Visible="false" Text="⏪" runat="server" CssClass="p-0 m-0 fs-2 pb-1 bg-transparent" ID="btnSiguiente" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnSiguiente_Click" />
                    <asp:Button Visible="false" Text="⏭️" runat="server" CssClass="p-0 m-0 fs-2 pb-1 bg-transparent" ID="btnAnterior" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnAnterior_Click" />
                </div>--%>
                <asp:Repeater runat="server" ID="repPaciente">
                    <ItemTemplate>
                        <div class="card border-secondary">
                            <div class="card-header">
                                <h5 class="card-title"><%#Eval("apellidos") %>, <%#Eval("nombres") %> </h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">Edad: <%#Eval("edad")%> </p>
                                <p class="card-text">Género: <%#Eval("sexo")%> </p>
                                <p class="card-text">Obra Social: <%#Eval("obrasocial.descripcion")%> </p>
                                <p class="card-text">Fecha de nacimiento: <%#Eval("fechaNacimiento", "{0: dd/MM/yyyy}")%> </p>
                            </div>
                        </div>                                                             
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-12 px-4">
                <asp:Repeater runat="server" ID="repNotasTurno">
                    <ItemTemplate>
                        <div class="card border-secondary ">
                            <div class="card-header">
                                <h5 class="card-title">Notas turno: <%#Eval("fecha", "{0: dd/MM/yyyy}") %> - <%#Eval("hora") %></h5>
                            </div>
                            <div class="card-body d-flex flex-column">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="col">
                                            <label cssclass="card-text" for="ddlEstadoTurno" class="form-label">Asistencia al turno: </label>
                                            <asp:Button Text="Asistió" runat="server" CssClass="btn btn-primary mx-4 mb-3" ID="btnAsistio" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnActualizarEstado_Click" />
                                            <asp:Button Text="No asistió" runat="server" CssClass="btn btn-primary mb-3" ID="btnNoAsistio" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnActualizarEstado_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col">
                                <label for="txtObservaciones" class="form-label">Observaciones:</label>
                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtObservaciones" CssClass="form-control" />
                            </div>
                            <asp:Button Text="Guardar cambios" runat="server" CssClass="btn btn-primary mt-3 align-self-center" ID="btnModificar" CommandArgument='<%#Eval("id")%>' CommandName="TurnoId" OnClick="btnModificar_Click" />
                        </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>
</asp:Content>
