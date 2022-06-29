<%@ Page Title="Especialidades" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="EspecialidadListado.aspx.cs" Inherits="TurnosAppWeb.EspecialidadListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-4 my-2">
        <asp:TextBox runat="server" ID="txtbuscar" CssClass="form-control px-lg-3" />
        <div class="d-flex flex-row-reverse">
            <asp:Button ID="btnbuscar" runat="server" Text="Buscar Especialidad" CssClass="btn btn-primary mt-2" OnClick="btnbuscar_Click" />
        </div>
    </div>
    <div class="col-md-4">
        <asp:GridView ID="dgvlistaespecialidades" DataKeyNames="id" runat="server" CssClass="table table-dark" AutoGenerateColumns="false" OnSelectedIndexChanged="listaespecialidades_SelectedIndexChanged">
            <Columns>
                <asp:BoundField HeaderText="Id" DataField="id" />
                <asp:BoundField HeaderText="Descripcion" DataField="descripcion" />
                <asp:CommandField HeaderText="Editar" SelectText="Editar" ShowSelectButton="true" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
