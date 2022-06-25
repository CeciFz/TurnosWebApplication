<%@ Page Title="" Language="C#" MasterPageFile="~/TunosWeb.Master" AutoEventWireup="true" CodeBehind="ObraSocialListado.aspx.cs" Inherits="TurnosAppWeb.ObraSocialListado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-grid default">
        <div class="container">
            <div class="col-md-4">
                <asp:GridView ID="dgvlistaObrasSociales" runat="server" OnSelectedIndexChanged="dgvlistaObrasSociales_SelectedIndexChanged" DataKeyNames="id" CssClass="table table-dark table-borderer" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Id" DataField="id" />
                        <asp:BoundField HeaderText="Descripcion" DataField="descripcion" />
                        <asp:CommandField HeaderText="Editar" SelectText="Editar" ShowSelectButton="true" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
