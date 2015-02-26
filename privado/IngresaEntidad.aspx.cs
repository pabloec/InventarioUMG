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
using System.IO;

public partial class privado_IngresaEntidad : System.Web.UI.Page
{

      public SqlConnection sqlconectar;
      public SqlCommand cmd;
      DataSet dtsBusqueda = new DataSet();
      DataSet dtsInset = new DataSet();

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
               
    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) 
        {
        }
        try
        {
            DataSet IngEntidad = Ingresa_Entidad(txtNombre.Text, txtApellido.Text, txtDireccion.Text, Convert.ToInt32(txtTelefono.Text), Convert.ToInt32(txtCelular.Text), txtNit.Text);

            if (Convert.ToInt32(IngEntidad.Tables[0].Rows[0][0].ToString()) != 0)
            {
                lbMensaje.Visible = true;
                lbMensaje.Text = "Entidad Ingresada Satisfactoriamente";

                Session["Nombre"] = txtNombre.Text + " " + txtApellido.Text;
                Session["IdEntidad"] = IngEntidad.Tables[0].Rows[0][0].ToString();

                txtNombre.Text = "";
                txtApellido.Text = "";
                txtDireccion.Text = "";
                txtCelular.Text = "";
                txtTelefono.Text = "";
                txtNit.Text = "";
            }
        }
        catch (Exception ex)
        {
            Muesta_Error("ERROR: " + ex);
        }
               
    }


        public DataSet Ingresa_Entidad(string nombre, string apellido, string direccion, int telefono, int cel, string nit)
        {
            try
            {  
                Conexion_SQL();
                cmd = new SqlCommand("SPR_Ingresa_Entidad", sqlconectar);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = (nombre);
                cmd.Parameters.Add("@apellido", SqlDbType.VarChar, 50).Value = (apellido);
                cmd.Parameters.Add("@direcion", SqlDbType.VarChar, 150).Value = (direccion);
                cmd.Parameters.Add("@telefono", SqlDbType.Int).Value = (telefono);
                cmd.Parameters.Add("@cel", SqlDbType.Int).Value = (cel);
                cmd.Parameters.Add("@nit", SqlDbType.VarChar, 10).Value = (nit);
                SqlDataAdapter dsdato = new SqlDataAdapter();
                dsdato.SelectCommand = cmd;
                dsdato.Fill(dtsInset);

            }
            catch(Exception ex) { 
                Muesta_Error("ERROR: " + ex);
                 return dtsInset;
            }
            return dtsInset;
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
           catch(Exception ex) {
               Muesta_Error( "ERROR: " + ex);
                return 0; }

            return 1;
        }

        public DataSet Busca_Entidad(string buscar)
        {
            try
            {
                Conexion_SQL();
                cmd = new SqlCommand("SP_Busca_Entidad", sqlconectar);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection.Open();
                cmd.Parameters.Add("@busqueda", SqlDbType.VarChar, 50).Value = (buscar);
                SqlDataAdapter dsdato = new SqlDataAdapter();
                dsdato.SelectCommand = cmd;
                dsdato.Fill(dtsBusqueda);
            }
            catch(Exception ex)
            {
                Muesta_Error("ERROR: " + ex);
                return dtsBusqueda;
            }

            return dtsBusqueda;
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
            btnSalirMsg.Visible = true;
        }

        public void ValidaDatos(string nombre, string apellido, string direccion, int telefono, int cel, string nit)
        { 
            
        
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dtsDatos = Busca_Entidad(txtBuscarEntidad.Text);

                if (dtsDatos.Tables[0].Rows.Count == 0)
                {
                    Muesta_Error("No se encontraron Datos");
                }
                else
                {
                    GridEntidad.DataSource = dtsDatos;
                    GridEntidad.DataBind();
                }
            }
            catch
            {
                Muesta_Error("No se pudo realizar la Busqueda.");
            }

        }
        protected void GridEntidad_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        protected void btnSalirMsg_Click(object sender, EventArgs e)
        {
            ALerta.Visible = false;
            lbError.Visible = false;
            lbError.Text = "";
            btnSalirMsg.Visible = false;
        }
        protected void btnMensaje_Click(object sender, EventArgs e)
        {
            ALertaMensj.Visible = false;
            lbMensaje.Visible = false;
            lbMensaje.Text = "";
            btnSalirMsg.Visible = false;
        }
}
