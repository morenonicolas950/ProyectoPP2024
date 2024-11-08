<%@ Page Title="Resultados de la búsqueda" Language="C#" MasterPageFile="~/Usuario.Master"
    AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="ProyectoPP2024.Resultados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- RESULTADOS MATERIAS -->
    <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
        
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
                
                <asp:HyperLinkField DataNavigateUrlFields="ID_PROFESOR"  
                    DataNavigateUrlFormatString="Contacto.aspx?Id_profesor={0}" Text="CONTACTO" 
                    HeaderText="CONTACTO" />
            </Columns>
          
        </asp:GridView>
        

    </div>
    
    <div class="d-flex ml-4 mt-3 flex-column border-dark mb-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click"
            CssClass="btn-outline-info" />
    </div>
</asp:Content>
