<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="ProyectoPP2024.inicio" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container m-5 vh-100 vw-80">
        <div class= "d-flex justify-content-between" >
        <div class="card text-black h-25" style="background-color:#FEFAE0; font-size: large";>
          <div class="card-header">Usuarios</div>
          <div class="card-body">
            <label id="lblUsuarios" runat="server" class="d-flex justify-content-end">N</label>
          </div>
        </div>
        <div class="card text-black h-25" style="background-color:#FEFAE0; font-size: large";>
          <div class="card-header">Profesores</div>
          <div class="card-body">
            <label id="lblProfesores" runat="server" class="d-flex justify-content-end">N</label>
          </div>
        </div>
        <div class="card text-black mb-3 h-25" style="background-color:#FEFAE0; font-size: large";>
          <div class="card-header">Materias</div>
          <div class="card-body">
            <label id="lblMaterias"  runat="server" class="d-flex justify-content-end">N</label>
          </div>
      </div>
      </div>
      <div class="d-flex flex-column">
        <h4 class="text-center m-2"> Profesores y materias que dictan </h4>
        <div style="overflow: auto; height: 300px; width:auto;" >
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             DataSourceID="SqlDataSource1" BackColor="#FEFAE0" 
             EmptyDataText="No hay registros de datos para mostrar." CssClass="table table-borderless table-hover text-center overflow-auto">
             <Columns>
                 <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                     SortExpression="NOMBRE" />
                 <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" 
                     SortExpression="APELLIDO" />
                 <asp:BoundField DataField="DESCRIPCION" HeaderText="MATERIA" 
                     SortExpression="DESCRIPCION" />
                 <asp:BoundField DataField="PRECIO" HeaderText="PRECIO" 
                     SortExpression="PRECIO" />
             </Columns>
         </asp:GridView>
         </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
             DeleteCommand="DELETE FROM [DICTA_MATERIA] WHERE [ID] = @ID" 
             InsertCommand="INSERT INTO [DICTA_MATERIA] ([ID_PROFESOR], [ID_MATERIA], [PRECIO]) VALUES (@ID_PROFESOR, @ID_MATERIA, @PRECIO)" 
             SelectCommand="SELECT PROFESOR.NOMBRE, PROFESOR.APELLIDO, MATERIA.DESCRIPCION, DICTA_MATERIA.PRECIO FROM DICTA_MATERIA INNER JOIN PROFESOR ON PROFESOR.ID_PROFESOR = DICTA_MATERIA.ID_PROFESOR INNER JOIN MATERIA ON DICTA_MATERIA.ID_MATERIA = MATERIA.ID_MATERIA" 
             UpdateCommand="UPDATE [DICTA_MATERIA] SET [ID_PROFESOR] = @ID_PROFESOR, [ID_MATERIA] = @ID_MATERIA, [PRECIO] = @PRECIO WHERE [ID] = @ID">
             <DeleteParameters>
                 <asp:Parameter Name="ID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="ID_PROFESOR" Type="Int32" />
                 <asp:Parameter Name="ID_MATERIA" Type="Int32" />
                 <asp:Parameter Name="PRECIO" Type="Double" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="ID_PROFESOR" Type="Int32" />
                 <asp:Parameter Name="ID_MATERIA" Type="Int32" />
                 <asp:Parameter Name="PRECIO" Type="Double" />
                 <asp:Parameter Name="ID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
         </div>
      </div>
</asp:Content>
