<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="TurnoForm.aspx.cs" Inherits="TurnosAppWeb.TurnoForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-md-6 px-4">
        <div class="card border-secondary">
            <div class="card-header">
            </div>
            <div class="card-body">
                <div class="col">
                    <label for="txtApellidos" class="form-label">Apellidos</label>
                    <asp:TextBox runat="server" ID="txtApellidos" CssClass="form-control" />
                </div>
                <div class="col">
                    <label for="ddlPaciente" class="form-label">Paciente: </label>
                    <asp:DropDownList runat="server" ID="ddlPaciente" class="form-select"></asp:DropDownList>
                </div>
                <hr />
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <%--<div class="row">--%>
                        <div class="col">
                            <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidades"></asp:Label>
                            <asp:DropDownList ID="ddlEspecialidad" CssClass="form-select" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblProfesional" runat="server" Text="Profesionales"></asp:Label>
                            <asp:DropDownList ID="ddlProfesionales" CssClass="form-select" AutoPostBack="true"
                                runat="server" OnSelectedIndexChanged="ddlProfesionales_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col">
                            <asp:Label ID="lblDias" runat="server" CssClass="form-label" Text="Día:"></asp:Label>
                            <asp:DropDownList ID="ddlDias" CssClass="form-select" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlDias_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col mt-2">
                            <asp:Label ID="lblTurnosDisponibles" runat="server" CssClass="form-label" Text="Turnos Disponibles:"></asp:Label>
                            <div class=" d-inline-flex">
                                <asp:DropDownList ID="ddlFecha" CssClass="form-select" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlFecha_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlHora" CssClass="form-select" runat="server" AutoPostBack="true"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col mt-2 text-center">
                            <asp:Label ID="lblSinTurno" runat="server" CssClass="form-label" Text="Sin Turnos Disponibles para este día" Visible="false"></asp:Label>
                        </div>
                        <div class="col mt-2">
                            <asp:Label ID="lblObservaciones" runat="server" CssClass="form-label" Text="Observaciones:"></asp:Label>
                        </div>
                        <div class="col m-2">
                            <asp:TextBox ID="txtObservaciones" TextMode="MultiLine" runat="server"></asp:TextBox>
                        </div>
                        <%--                        </div>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button Text="Agendar" runat="server" CssClass="btn btn-primary" ID="btnAgendar" OnClick="btnAgendar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
