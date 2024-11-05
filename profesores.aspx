<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="profesores.aspx.cs" Inherits="ProyectoPP2024.profesores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class= "d-flex ml-4 mt-5 flex-column border-dark mb-4 vw-80">
        <div class="h-50 bg-dark border-white mb-3 d-flex justify-content-center"  >
            <asp:Button ID="Btn_NuevoProfesor" runat="server" Text="Nuevo" Width="120px" 
                BackColor="LightGreen" CssClass="m-2 mr-3" onclick="Btn_NuevoProfesor_Click"/>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_PROFESOR"
                DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar."
                CssClass="table table-borderless table-hover text-center" 
                AllowSorting="True" onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ID_PROFESOR" HeaderText="ID_PROFESOR" ReadOnly="True"
                        SortExpression="ID_PROFESOR" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                    <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" SortExpression="APELLIDO" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" SortExpression="TELEFONO" />
                    <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" SortExpression="DESCRIPCION" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="Editar" CommandArgument='<%# Container.DataItemIndex.ToString() %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="delete" CommandArgument='<%# Eval("ID_PROFESOR") %>' OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este registro?');" />
            </ItemTemplate>
        </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [PROFESOR] WHERE [ID_PROFESOR] = @ID_PROFESOR" 
                    InsertCommand="INSERT INTO [PROFESOR] ([NOMBRE], [APELLIDO], [EMAIL], [TELEFONO], [ID_LOCALIDAD]) VALUES (@NOMBRE, @APELLIDO, @EMAIL, @TELEFONO, @ID_LOCALIDAD)" 
                    ProviderName="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT PROFESOR.ID_PROFESOR, PROFESOR.NOMBRE, PROFESOR.APELLIDO, PROFESOR.EMAIL, 
                                   PROFESOR.TELEFONO, LOCALIDAD.DESCRIPCION AS LOCALIDAD
                                   FROM PROFESOR 
                                   JOIN LOCALIDAD ON PROFESOR.ID_LOCALIDAD = LOCALIDAD.ID_LOCALIDAD" 
                    UpdateCommand="UPDATE [PROFESOR] SET [NOMBRE] = @NOMBRE, [APELLIDO] = @APELLIDO, [EMAIL] = @EMAIL, [TELEFONO] = @TELEFONO, [ID_LOCALIDAD] = @ID_LOCALIDAD WHERE [ID_PROFESOR] = @ID_PROFESOR">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_PROFESOR" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NOMBRE" Type="String" />
                        <asp:Parameter Name="APELLIDO" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="TELEFONO" Type="Int32" />
                        <asp:Parameter Name="ID_LOCALIDAD" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NOMBRE" Type="String" />
                        <asp:Parameter Name="APELLIDO" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="TELEFONO" Type="Int32" />
                        <asp:Parameter Name="ID_LOCALIDAD" Type="Int32" />
                        <asp:Parameter Name="ID_PROFESOR" Type="Int32" />
                    </UpdateParameters>
             </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

