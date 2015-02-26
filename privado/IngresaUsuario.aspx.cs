using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.Common;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class privado_IngresaUsuario : System.Web.UI.Page
{
    public SqlConnection sqlconectar;
    public SqlCommand cmd;
    DataSet dtsBusqueda = new DataSet();
    DataTable dt = new DataTable();

    private void Conexion_SQL()
    {
        try
        {
            sqlconectar = new SqlConnection();
            sqlconectar.ConnectionString = @"server=localhost;user id=sa;password=Proyecto123;database=SCB_Prueba;";
            //sqlconectar.Open();
        }
        catch (Exception e)
        {
            Muesta_Error("Error: Coneccion no establecida");
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
            llegaListPerfil();
            llenaEntidad();
        }

        //ALerta.Visible = false;
        //ALertaMensj.Visible = false;
       txtNombre.Text = listEntidad.SelectedItem.ToString();
        
    }



    public void llegaListPerfil() {
        try
        {

            Conexion_SQL();
            SqlCommand OrdenSqlSelect = new SqlCommand("Select Id_Perfil, Descripcion From Perfil Where Estatus = 2", sqlconectar);
            SqlDataAdapter da = new SqlDataAdapter(OrdenSqlSelect.CommandText, sqlconectar);
            DataSet ds = new DataSet();
            da.Fill(ds);

            listPerfil.DataSource = ds;
            listPerfil.DataValueField = "Id_Perfil";
            listPerfil.DataTextField = "Descripcion";
            listPerfil.DataBind();
            listPerfil.Items.Insert(0, new ListItem("Elija una Opcion..", "0"));
        }
        catch {
           Muesta_Error( "ERROR: Al llenar lista de Perfiles.");
            btnAgregar.Enabled = false;
        }
    }

    public void llenaEntidad()
    {
        try
        {

            Conexion_SQL();
            SqlCommand OrdenSqlSelect = new SqlCommand("Select id_Entidad, Nombre + ' ' + ISNULL(Apellido,'') AS NOMBRE From Entidad", sqlconectar);
            SqlDataAdapter da = new SqlDataAdapter(OrdenSqlSelect.CommandText, sqlconectar);
            DataSet ds = new DataSet();
            da.Fill(ds);

            listEntidad.DataSource = ds;
            listEntidad.DataValueField = "Id_Entidad";
            listEntidad.DataTextField = "NOMBRE";
            listEntidad.DataBind();
            listEntidad.Items.Insert(0, new ListItem("Elija una Opcion..", "0"));

        }
        catch {
            Muesta_Error("ERROR: Al llenar lista de Entidades.");
            btnAgregar.Enabled = false;
        }
    }



    public int Ingres_Usuario(string nickname, string sexo, string password, string dpi, string IdEntidad, string idPerfil)
    {
        try
        {
            int EntiPerfil = Ingres_EntidadPerfil(IdEntidad,idPerfil);
            if (EntiPerfil == 1)
            {
                Conexion_SQL();
                cmd = new SqlCommand("SPR_Ingresa_Usuario", sqlconectar);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();
                cmd.Parameters.Add("@nickname", SqlDbType.VarChar, 50).Value = (nickname);
                cmd.Parameters.Add("@sexo", SqlDbType.VarChar, 1).Value = (sexo);
                cmd.Parameters.Add("@pass", SqlDbType.VarChar, 150).Value = (password);
                cmd.Parameters.Add("@dpi", SqlDbType.VarChar,13).Value = (dpi);
                cmd.Parameters.Add("@entidad", SqlDbType.VarChar,50).Value = (IdEntidad);
                cmd.Parameters.Add("@perfil", SqlDbType.VarChar,50).Value = (idPerfil);
                cmd.ExecuteNonQuery();
            }
            else{return 0;}

        }
        catch (Exception ex)
        {
            Muesta_Error("ERROR: " + ex);
            return 0;
        }

        return 1;
    }
    public int Ingres_EntidadPerfil(string IdEntidad, string idPerfil)
    {
        try
        {
            Conexion_SQL();
            cmd = new SqlCommand("SPR_Ingresa_EntidadPerfil", sqlconectar);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            cmd.Parameters.Add("@entidad", SqlDbType.Int).Value = (Convert.ToInt32(IdEntidad));
            cmd.Parameters.Add("@perfil", SqlDbType.Int).Value = (Convert.ToInt32(idPerfil));
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Muesta_Error("ERROR: Cliente ya se encuentra Registrado");
            return 0;
        }

        return 1;
    }


    public int Editar_Empleado(string nombre, string apellido, string direccion, int telefono, int cel, string nit, int id)
    {
        try
        {
            Conexion_SQL();
            cmd = new SqlCommand("SP_Editar_Empleado", sqlconectar);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection.Open();
            cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = (nombre);
            cmd.Parameters.Add("@apellido", SqlDbType.VarChar, 50).Value = (apellido);
            cmd.Parameters.Add("@imagen", SqlDbType.Image).Value = (direccion);
            cmd.Parameters.Add("@puesto", SqlDbType.VarChar, 50).Value = (telefono);
            cmd.Parameters.Add("@contraseña", SqlDbType.VarChar, 50).Value = (cel);
            cmd.Parameters.Add("@codigo", SqlDbType.VarChar, 100).Value = (nit);
            cmd.Parameters.Add("@id", SqlDbType.Int).Value = (id);

            cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            Muesta_Error("ERROR: " + ex);
            return 0;
        }

        return 1;
    }

    public DataTable Busca_Usuario(string buscar)
    {   
            try
            {
                Conexion_SQL();
                cmd = new SqlCommand("SP_Busca_Usuario", sqlconectar);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();
                cmd.Parameters.Add("@busqueda", SqlDbType.VarChar, 50).Value = (buscar);
                SqlDataAdapter dsdato = new SqlDataAdapter();
                dsdato.SelectCommand = cmd;
                dsdato.Fill(dt);
            }
            catch (Exception ex)
            {
                Muesta_Error("ERROR: " + ex);
                return dt;
            }

            return dt;
   }




    protected void listEntidad_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtNombre.Text = listEntidad.SelectedItem.ToString();
    }


    protected void btnAgregar_Click(object sender, EventArgs e)
    {
            int valida = ValidaDatos(txtNickName.Text, listSexo.SelectedValue.ToString(), txtPassword.Text, txtPassword2.Text, txtIdentificacion.Text, listEntidad.SelectedValue.ToString(), listPerfil.SelectedValue.ToString());

            if (valida == 1)
            {
                int dtsUsu = Ingres_Usuario(txtNickName.Text, listSexo.SelectedValue.ToString(), txtPassword.Text, txtIdentificacion.Text, listEntidad.SelectedValue.ToString(), listPerfil.SelectedValue.ToString());

                if (dtsUsu == 1)
                {
                    Muesta_Mensaje("Usuario Ingresado Satisfactoriamente");
                    txtNombre.Text = "";
                    txtIdentificacion.Text = "";
                    txtNickName.Text = "";
                    txtPassword.Text = "";
                    txtPassword2.Text = "";
                }
            }
            if (!Page.IsPostBack)
            { }
    }



    public int ValidaDatos(string nickname, string sexo, string password, string password2, string dpi, string IdEntidad, string idPerfil)
    {

         if (listPerfil.SelectedValue == "0")
        {
           Muesta_Error("Ingrese Perfil");
            return 0;
        }
         else if (listEntidad.SelectedValue == "0")
         {
             Muesta_Error("Ingrese Entidad");
             return 0;
         }
         else if (dpi.Length < 13)
        {
            Muesta_Error("Identificacion Incorrecta. Ingrese su DPI");
            txtIdentificacion.Focus();
            return 0;
        }
        else if (nickname == "")
        {
            Muesta_Error("Ingrese el Nickname");
            txtNickName.Focus();
            return 0;
        }
        else if (password != password2)
        {
            Muesta_Error("Contraseña No Coincide");
            txtPassword.Focus();
            return 0;
        }
        else if (password.Length < 6)
        {
            Muesta_Error("Contraseña debe de ser Mayor a 6 caracteres");
            txtPassword.Focus();
            return 0;
        }
        
        else if (listSexo.SelectedValue == "0")
        {
            Muesta_Error("Ingrese Sexo");
            return 0;
        }
       
        else
        { return 1; }

    }

    public void Muesta_Error(string error)
    {
        ALerta.Visible = true;
        lbError.Visible = true;
        lbError.Text = error;
        btnSalirMsg.Visible = true;    
    }

    public void Muesta_Mensaje(string mensaje)
    {
        ALertaMensj.Visible = true;
        lbMensaje.Visible = true;
        lbMensaje.Text = mensaje;
        btnMensaje.Visible = true;
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        DataTable dtsDatos =  Busca_Usuario(txtBuscarUsuario.Text);

        if (dtsDatos.Rows.Count == 0)
        {
            Muesta_Error("No se Encontraron Datos");
        }
        else
        {
            GridUsuarios.DataSource = dtsDatos;
            GridUsuarios.DataBind();
        }
    }
    protected void btnSalirMsg_Click(object sender, EventArgs e)
    {
        lbError.Visible = false;
        btnSalirMsg.Visible = false;
        ALerta.Visible = false;
    }
    protected void btnMensaje_Click(object sender, EventArgs e)
    {
        ALertaMensj.Visible = false;
        btnMensaje.Visible = false;
        ALertaMensj.Visible = false;
    }



    protected void GridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
    {
        int fil = GridUsuarios.Rows.Count ;

        GridViewRow row = GridUsuarios.SelectedRow;
        int fila = row.RowIndex;

        GridView gv = (GridView)sender;
        int filaSeleccionada = gv.SelectedIndex;
        LinkButton lb = gv.Rows[filaSeleccionada].Cells[0].Controls[0] as LinkButton;

        DataTable dtsDatos = Busca_Usuario(txtBuscarUsuario.Text);
        string dtab = dtsDatos.Rows[fila][1].ToString();

        Muesta_Mensaje("Boton Seleccionar fila " + dtab);
        
    }


}