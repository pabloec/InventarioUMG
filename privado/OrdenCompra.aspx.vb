Imports System.Data.SqlClient
Imports System.IO
Imports System.Data
Partial Class OrdenCompra
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim Usuario As String = Session("idusuario")
        If Usuario = "" Then
            FormsAuthentication.RedirectToLoginPage()
        Else

            husuario.Value = Usuario

            ausuario.InnerHtml = "Bienvenido " + Usuario
            Dim str As String
            Dim Adaptador As New SqlDataAdapter
            Dim usuariotabla As New DataSet
            Using conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("EjemploConString").ConnectionString)


                conexion.Open()
                Dim comand As SqlCommand
                comand = conexion.CreateCommand
                str = "EXEC	SP_Permiso @usuario = " & Session("id") & ",@pagina = 10,@accion = 1"

                comand.CommandText = str
                Adaptador.SelectCommand = comand

                Adaptador.SelectCommand = comand
                Adaptador.Fill(usuariotabla)
            End Using
            Dim resultado As Integer

            resultado = usuariotabla.Tables(0).Rows(0).Item("permiso")

            If resultado = 0 Then
                Response.Redirect("error.html")
            End If

        End If
    End Sub
End Class
