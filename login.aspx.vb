Imports System.Data
Imports System.Data.SqlClient

Partial Class privado_login
    Inherits System.Web.UI.Page

  
    Protected Sub LnkConectar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LnkConectar.Click
        Try

            Dim str As String
            Dim Adaptador As New SqlDataAdapter
            Dim TablaUsuario As New DataTable
            Using conexion As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("EjemploConString").ConnectionString)
                conexion.Open()
                Dim comando As SqlCommand
                comando = conexion.CreateCommand
                comando.CommandType = Data.CommandType.Text
                comando.Parameters.Add("@idusuario", SqlDbType.VarChar, 15).Value = txtusuario.Value
                comando.Parameters.Add("@password", SqlDbType.VarChar, 15).Value = txtpass.Value
                str = "select id_usuario,usuario,password,id_Perfil from usuario where usuario = @idusuario and password=@password and estatus=2"
                comando.CommandText = str

                Adaptador.SelectCommand = comando
                Adaptador.Fill(TablaUsuario)
                If TablaUsuario.Rows.Count > 0 Then

                    Session("idusuario") = TablaUsuario.Rows(0).Item("usuario")
                    Session("id") = TablaUsuario.Rows(0).Item("id_usuario")
                    'Session("idempresa") = TablaUsuario.Rows(0).Item("idempresa")
                    Session("perfil") = TablaUsuario.Rows(0).Item("id_Perfil")
                    'Session("establecimiento") = TablaUsuario.Rows(0).Item("establecimiento")

                    comando.Dispose()

                    FormsAuthentication.RedirectFromLoginPage(txtusuario.Value, False)
                Else

                    lblestado.InnerHtml = "Datos incorrectos"
                End If
            End Using
        Catch ex As SqlException
            lblestado.InnerHtml = "Sucedio un error: " + ex.Message

        Finally
            'conexion.Close()
            'conexion = Nothing
        End Try
    End Sub
End Class
