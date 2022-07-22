<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="ProfesionalListado.aspx.cs" Inherits="TurnosAppWeb.ProfesionalListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="col-md-6 my-2 d-flex">
        <asp:TextBox runat="server" ID="txtbuscaru" CssClass="form-control me-4" />
        <asp:Button ID="btnbuscar" runat="server" Text="Filtro DNI" CssClass="btn btn-primary me-2" OnClick="btnbuscar_Click" />
    </div>--%>
    <div class="col-md-12 d-flex">
        <div class="col-md-6">
            <asp:GridView ID="dgvlistaProfesionales" runat="server" DataKeyNames="id" OnSelectedIndexChanged="dgvlistaProfesionales_SelectedIndexChanged" CssClass="table thead-light table-borderer table-sm table-hover" AutoGenerateColumns="false" OnPageIndexChanging="dgvlistaProfesionales_PageIndexChanging" AllowPaging="True" AllowCustomPaging="False" PageSize="10">
                <Columns>
                    <asp:BoundField HeaderText="Apellidos" DataField="apellidos" />
                    <asp:BoundField HeaderText="Nombres" DataField="nombres" />
                    <%--<asp:BoundField HeaderText="Fecha de alta" DataField="fechaAlta" />--%>
                    <asp:CommandField HeaderText="" SelectText="Ver detalle" ShowSelectButton="true" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-6 px-4">
            <asp:Repeater runat="server" ID="repProfesional">
                <ItemTemplate>
                    <div class="card border-secondary">
                        <div class="card-header">
                            <h5 class="card-title"><%#Eval("apellidos") %>, <%#Eval("nombres") %> </h5>
                        </div>
                        <div class="card-body">
                            <div class="d-flex d-flex-column justify-content-between">
                                <div>
                                    <p class="card-text">Sexo: <%#Eval("sexo")%> </p>
                                    <p class="card-text">Teléfono: <%#Eval("telefono")%> </p>
                                    <p class="card-text">Mail: <%#Eval("mail")%> </p>
                                </div>
                                <div>
                                    <label class="card-text">Especialidades: </label>
                                    <%foreach (TurnosDominio.Especialidad esp in especialidad)
                                        { %>
                                    <%--                                <asp:textbox cssclass="card-text" id="txtEspecialidad" runat="server">"esp.descripcion"</asp:textbox>--%>
                                    <li class="card-text ms-4" id="txtEspecialidad"><%:esp.descripcion %> </li>
                                    <%} %>

                                    <br />
                                    <label class="card-text">Horarios: </label>
                                    <%foreach (TurnosDominio.Horario hr in horarios)
                                        { %>
                                    <%--                                <asp:textbox cssclass="card-text" id="txtEspecialidad" runat="server">"esp.descripcion"</asp:textbox>--%>
                                    <li class="card-text ms-4" id="txtHorarios"><%:hr.dia + " de " + hr.horaInicio + " a " + hr.horaFin %> </li>
                                    <%} %>
                                </div>
                            </div>
<%--                            <div>
                                <asp:Button Text="Modificar" runat="server" CssClass="btn btn-primary my border-secondary mt-4" ID="btnModificar" CommandArgument='<%#Eval("Id")%>' CommandName="UsuarioId" OnClick="btnModificar_Click" />
                            </div>--%>
                        </div>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
