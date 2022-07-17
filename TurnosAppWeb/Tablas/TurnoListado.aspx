<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="TurnoListado.aspx.cs" Inherits="TurnosAppWeb.Tablas.TurnoListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12 d-flex">
        <div class="col-md-10">


            <% foreach (DateTime f in fechas)
                {      
                lblFecha.Text = f.ToString("dd-MM-yyyy");
                dgvlistaTurnos.DataSource = listaTurnos.FindAll(x => x.fecha == f);
                dgvlistaTurnos.DataBind();
            %>
            <asp:Label ID="lblFecha" Text="text" runat="server" />
            <asp:GridView OnPageIndexChanging="dgvlistaTurnos_PageIndexChanging" ID="dgvlistaTurnos" runat="server" DataKeyNames="id" OnSelectedIndexChanged="dgvlistaTurnos_SelectedIndexChanged" CssClass="table thead-light table-borderer table-sm table-hover" AutoGenerateColumns="false" AllowPaging="True" AllowCustomPaging="False" PageSize="20">

                <Columns>
                    <asp:BoundField HeaderText="Hora" DataField="hora" DataFormatString="{0:hh\:mm}" />
                    <asp:BoundField HeaderText="Especialidad" DataField="especialidad.descripcion" />
                    <asp:BoundField HeaderText="Profesional" DataField="profesional.nombres" />
                    <asp:BoundField HeaderText="Paciente" DataField="paciente.nombres" />
<%--                    <asp:BoundField HeaderText="Fecha" DataField="fecha" DataFormatString="{0:dd/MM/yyyy}" />--%>
                    <asp:BoundField HeaderText="Estado" DataField="estado.descripcion" />
                    <asp:CommandField HeaderText="" SelectText="Modificar" ShowSelectButton="true" />
                </Columns>

            </asp:GridView>
            <%}%>

            <%--            <asp:Repeater runat="server" ID="repTurnos">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("fecha") %>' runat="server" />

                                <%foreach (TurnosDominio.Turno t in listaTurnos)
                { %>
            <asp:TextBox runat="server" Text='<%# Eval("fecha") %>' />
            <asp:TextBox runat="server" Text='<%# Eval("paciente.nombres") %>' />
                                <%} %>
                </ItemTemplate>
            </asp:Repeater>--%>
        </div>
    </div>
</asp:Content>
