<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="UsuarioListado.aspx.cs" Inherits="TurnosAppWeb.UsuarioListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6 my-2 d-flex">
        <asp:TextBox runat="server" ID="txtbuscaru" CssClass="form-control me-4" />
        <asp:Button ID="btnbuscar" runat="server" Text="Filtro DNI" CssClass="btn btn-primary me-2" OnClick="btnbuscar_Click" />
    </div>
    <div class="col-md-12 d-flex">
        <div class="col-md-6">
            <asp:GridView OnPageIndexChanging="dgvlistaUsuarios_PageIndexChanging" ID="dgvlistaUsuarios" runat="server" DataKeyNames="id" OnSelectedIndexChanged="listacontactos_SelectedIndexChanged" CssClass="table thead-light table-borderer table-sm table-hover" AutoGenerateColumns="false" AllowPaging="True" AllowCustomPaging="False" PageSize="10">
                <Columns>
                    <asp:BoundField HeaderText="Apellidos" DataField="apellidos" />
                    <asp:BoundField HeaderText="Nombres" DataField="nombres" />
                    <asp:BoundField HeaderText="Obra social" DataField="obraSocial.descripcion" />
                    <%--<asp:BoundField HeaderText="Fecha de alta" DataField="fechaAlta" />--%>
                    <asp:CommandField HeaderText="" SelectText="Ver detalle" ShowSelectButton="true" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-6 px-4">
            <asp:Repeater runat="server" ID="repUsuario">
                <ItemTemplate>
                        <div class="card border-secondary">
                            <div class="card-header">
                                <h5 class="card-title"><%#Eval("apellidos") %>, <%#Eval("nombres") %> </h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">Fecha de nacimiento: <%#Eval("fechaNacimiento", "{0: dd/MM/yyyy}")%> </p>
                                <p class="card-text"><%#Eval("tipoDocumento.descripcion")%>: <%#Eval("nroDocumento")%> </p>
                                <p class="card-text">Sexo: <%#Eval("sexo")%> </p>
                                <p class="card-text">Teléfono: <%#Eval("telefono")%> </p>
                                <p class="card-text">Mail: <%#Eval("mail")%> </p>
                                <div>
                                    <label class="card-text">Perfiles: </label>
                                    <%foreach (TurnosDominio.PerfilUsuario pu in perfil)
                                        { %>
                                    <label class="card-text"><%: pu.descripcion %> </label>
                                    <%} %>
                                </div>
                                <asp:Button Text="Modificar" runat="server" CssClass="btn btn-primary" ID="btnModificar" CommandArgument='<%#Eval("Id")%>' CommandName="UsuarioId" OnClick="btnModificar_Click" />
                            </div>
                        </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
