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
                            <div class="col">
                                <asp:Label ID="lblDias" runat="server" CssClass="form-label" Text="Día:"></asp:Label>
                                <asp:DropDownList ID="ddlDias" CssClass="form-select" runat="server" AutoPostBack="true"></asp:DropDownList>
                            </div>
<%--                        </div>--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
<%--                <asp:Button Text="Agendar" runat="server" CssClass="btn btn-primary" ID="btnAgendar" CommandArgument='<%#Eval("Id")%>' CommandName="UsuarioId" OnClick="btnAgendar_Click" />--%>
            </div>
        </div>
    </div>
</asp:Content>
