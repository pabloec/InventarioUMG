Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
 Public Class wsoperaciones
    Inherits System.Web.Services.WebService
    Public Class Operacion
        Public NumeroOrden As Integer
        Public id As Integer
        Public descripcion As String
    End Class


    <WebMethod()> _
    Public Function guardarCobros(ByVal arreglo As String) As List(Of Operacion)

        Dim Sqlinserta As String = "UPDATE taxis.descuento_detalle SET estatus=0 WHERE id_descuentos_detalle in(" & arreglo & ");"

        'Dim sqldescuento As String = "select id_descuento from descuento_detalle where id_descuentos_detalle in(" & arreglo & ");"

        Dim result As List(Of Operacion) = New List(Of Operacion)()
        Using connection As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("EjemploConString").ConnectionString)

            connection.Open()

            Dim comando As New SqlCommand
            Dim transaccion As SqlTransaction
            transaccion = connection.BeginTransaction
            comando.Connection = connection
            comando.Transaction = transaccion
            Try
                Dim Elemento As New Operacion
                comando.CommandText = Sqlinserta
                comando.ExecuteNonQuery()
                comando.CommandText = "SELECT @@IDENTITY"
                Elemento.descripcion = comando.ExecuteScalar

                ' Insert de Descuento  '

                Using conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("EjemploConString").ConnectionString)
                    Dim query As String = "select id_descuento id,valor_unitario valor " +
                                          "from descuento_detalle  " +
                                          "where id_descuentos_detalle in( " & arreglo & " );"
                    Dim queryinsert
                    Dim ejecutar
                    Dim command As New SqlCommand
                    Dim trans As SqlTransaction
                    Dim cmd As New SqlCommand(query, connection)
                    Dim reader As SqlDataReader = cmd.ExecuteReader()

                    conn.Open()
                    While (reader.Read())
                        'Dim Elemento As New Busqueda


                        Elemento.id = reader("id")
                        Elemento.descripcion = reader("valor")
                        queryinsert = "update descuento set cuotas_pagadas = cuotas_pagadas+1,total_abonado = total_abonado+" & Elemento.descripcion & " where id_descuento = 1 "



                        'trans = connection.BeginTransaction
                        command.Connection = conn
                        command.Transaction = transaccion


                        command.CommandText = queryinsert
                        command.ExecuteNonQuery()
                        ''command.CommandText = "SELECT @@IDENTITY"
                        ejecutar = command.ExecuteScalar



                        result.Add(Elemento)
                    End While
                    reader.Close()
                    conn.Close()
                End Using
                ' FIN DE DESCUENTO '

                transaccion.Commit()

                result.Add(Elemento)

            Catch ex As SqlException
                Dim Elemento As New Operacion
                Elemento.descripcion = "ERROR"

                result.Add(Elemento)
                transaccion.Rollback()

            Finally
                connection.Close()

            End Try
        End Using

        Return result
    End Function

End Class