<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="materias.aspx.cs" Inherits="ProyectoPP2024.materias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class= "d-flex ml-4 mt-5 flex-column border-dark mb-4 w-100">
    <div class="d-flex justify-content-end h-25">  
        <asp:Button ID="btn_AgregarMateria" runat="server" Text="Agregar Materia" CssClass="mb-3 bg-success h-auto" 
            onclick="btn_AgregarMateria_Click"/>
    </div>
    <div style="overflow: auto; height: 300px; width:auto;" >
    <asp:GridView ID="GridView1" runat="server" BackColor="#FEFAE0" AutoGenerateColumns="False" 
        DataKeyNames="ID_MATERIA" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." 
            CssClass="table table-borderless table-hover text-center" 
            onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="ID_MATERIA" HeaderText="ID_MATERIA" ReadOnly="True" 
                SortExpression="ID_MATERIA" />
            <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" 
                SortExpression="DESCRIPCION" />
                   <asp:TemplateField HeaderText="Modificar">
            <ItemTemplate>
                <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="Editar" CommandArgument='<%# Container.DataItemIndex.ToString() %>'/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Eliminar">
            <ItemTemplate>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%# Eval("ID_MATERIA") %>' OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este registro?');" />
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
        DeleteCommand="DELETE FROM [MATERIA] WHERE [ID_MATERIA] = @ID_MATERIA" 
        InsertCommand="INSERT INTO [MATERIA] ([DESCRIPCION]) VALUES (@DESCRIPCION)" 
        ProviderName="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [ID_MATERIA], [DESCRIPCION] FROM [MATERIA]" 
        UpdateCommand="UPDATE [MATERIA] SET [DESCRIPCION] = @DESCRIPCION WHERE [ID_MATERIA] = @ID_MATERIA">
        <DeleteParameters>
            <asp:Parameter Name="ID_MATERIA" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DESCRIPCION" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DESCRIPCION" Type="String" />
            <asp:Parameter Name="ID_MATERIA" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>

</asp:Content>
