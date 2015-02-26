Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
 Public Class wsconsultas
    Inherits System.Web.Services.WebService
    Public Class Consultas
        Public NumeroOrden As Integer
        Public id As Integer
        Public descripcion As String
    End Class


    <WebMethod()> _
    Public Function Validar() As List(Of Consultas)

        Dim result As List(Of Consultas) = New List(Of Consultas)
        Try
            Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("EjemploConString").ConnectionString)
                conn.Open()
                Dim comm As New SqlCommand("select coalesce(MAX(Orden_Compra),0)+1 numero from Orden_Compra", conn)

                Dim reader As SqlDataReader = comm.ExecuteReader()
                While (reader.Read())
                    Dim Elemento As New Consultas

                    Elemento.NumeroOrden = reader("numero")

                    result.Add(Elemento)
                End While
                conn.Close()

            End Using
        Catch ex As Exception
            Dim Elemento As New Consultas

            Elemento.NumeroOrden = ex.Message.ToString

            result.Add(Elemento)
        End Try
        Return result
    End Function


    <WebMethod()> _
    Public Function cargarProveedores() As List(Of Consultas)

        Dim result As List(Of Consultas) = New List(Of Consultas)
        Try
            Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("EjemploConString").ConnectionString)
                conn.Open()
                Dim comm As New SqlCommand("exec sp_cargar_proveedores", conn)

                Dim reader As SqlDataReader = comm.ExecuteReader()
                While (reader.Read())
                    Dim Elemento As New Consultas

                    Elemento.id = reader("id")
                    Elemento.descripcion = reader("nombre")

                    result.Add(Elemento)
                End While
                conn.Close()

            End Using
        Catch ex As Exception
            Dim Elemento As New Consultas

            Elemento.id = ex.Message.ToString

            result.Add(Elemento)
        End Try
        Return result
    End Function

    <WebMethod()> _
    Public Function cargarProductos() As List(Of Consultas)

        Dim result As List(Of Consultas) = New List(Of Consultas)
        Try
            Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("EjemploConString").ConnectionString)
                conn.Open()
                Dim comm As New SqlCommand("exec sp_cargar_productos", conn)

                Dim reader As SqlDataReader = comm.ExecuteReader()
                While (reader.Read())
                    Dim Elemento As New Consultas

                    Elemento.id = reader("id")
                    Elemento.descripcion = reader("nombre")

                    result.Add(Elemento)
                End While
                conn.Close()

            End Using
        Catch ex As Exception
            Dim Elemento As New Consultas

            Elemento.id = ex.Message.ToString

            result.Add(Elemento)
        End Try
        Return result
    End Function
End Class