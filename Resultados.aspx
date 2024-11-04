<%@ Page Title="Resultados de la búsqueda" Language="C#" MasterPageFile="~/Usuario.Master"
    AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="ProyectoPP2024.Resultados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- RESULTADOS MATERIAS -->
    <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
       <asp:GridView ID="GridViewResultados" runat="server" AutoGenerateColumns="False"
            CellPadding="10" CellSpacing="5" OnSelectedIndexChanged="GridViewResultados_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ID_PROFESOR" HeaderText="ID_PROFESOR" SortExpression="ID_PROFESOR"
                    Visible="false" />
                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" SortExpression="APELLIDO" />
                <asp:BoundField DataField="ID_MATERIA" HeaderText="ID_MATERIA" SortExpression="ID_MATERIA"
                    Visible="false" />
                <asp:BoundField DataField="MATERIA" HeaderText="MATERIA" SortExpression="MATERIA" />
                <asp:BoundField DataField="ID_LOCALIDAD" HeaderText="ID_LOCALIDAD" SortExpression="ID_LOCALIDAD"
                    Visible="false" />
                <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" SortExpression="LOCALIDAD" />
                <asp:TemplateField HeaderText="CONTACTO">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnContacto" runat="server" CssClass="btn btn-warning" CommandName="Contacto"
                            CommandArgument='<%# Container.DataItemIndex.ToString() %>' ImageUrl='~/Estilos/Imagenes/Ojo_para_ocultar.jpg'
                            Width="80px" Height="50px"></asp:ImageButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
          
        </asp:GridView>
        </asp:PlaceHolder>

    </div>
    
    <div class="d-flex ml-4 mt-5 flex-column border-dark mb-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click"
            CssClass="btn-outline-info" />
    </div>
</asp:Content>
