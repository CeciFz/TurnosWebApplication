using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosDominio;
using TurnosNegocio;

namespace TurnosAppWeb
{
    public partial class UsuarioForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //en dll_perfilusuario  ,lo utilizamos para cargar el tipo de usuario tomtamos el dato "" comparando si es igual asocie el tipo de dato,
            //ejemplo  dll_perfilusuario  if(dll_perfilusuario="profecional")  perfil.id=4; else if 

            TipoDocumentoNegocio tipoDocumentoNeg = new TipoDocumentoNegocio();
            ObraSocialNegocio obraSocialNeg = new ObraSocialNegocio();
            PerfilUsuarioNegocio perfilUsuarioNeg = new PerfilUsuarioNegocio();

            if (!IsPostBack)
            {   
                ddlTipoDocumento.DataSource = tipoDocumentoNeg.listarTiposDeDocumento();
                ddlTipoDocumento.DataBind();
               // ddlTipoDocumento.DataValueField = "Id";
                ddlObraSocial.DataSource = obraSocialNeg.listarObrasSociales();
                ddlObraSocial.DataBind();
                ddlPerfilusuario.DataSource = perfilUsuarioNeg.listarPerfilesUsuarios();
                ddlPerfilusuario.DataBind();
            }

            if (Request.QueryString["id"] != null && btnModificar.Visible==false)
            {   //captura el id 
                Int64 id = Int64.Parse(Request.QueryString["id"].ToString());
                // copia en lista temporal >> lo que hay en session
                List<Usuario> temporal = ((List<Usuario>)Session["listaUsuarios"]);
                //crea un objeto usuario llamado seleccionado y le copia lo que hay en la lista temporal q viene de session
                Usuario seleccionado = temporal.Find(x => x.id == id);
                //agrega los datos la pantalla .
                txtApellidos.Text = seleccionado.apellidos;
                txtNombres.Text = seleccionado.nombres;
                txtFechaNac.Text = seleccionado.fechaNacimiento.ToString("yyyy-MM-dd");
                ddlSexo.SelectedValue = seleccionado.sexo;
                ddlTipoDocumento.SelectedValue = seleccionado.tipoDocumento.descripcion;
                txtNroDocumento.Text = seleccionado.nroDocumento.ToString();
                txtTelefono.Text = seleccionado.telefono;
                txtMail.Text = seleccionado.mail;
                ddlObraSocial.SelectedValue = seleccionado.obraSocial.descripcion;

                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
            }

        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            ///agregar try y catch para que no se rompa cuando carga mal los datoss...

            try
            {
                Usuario usuario = new Usuario();
               UsuarioNegocio negocio = new UsuarioNegocio();
                

                usuario.apellidos = txtApellidos.Text;
                usuario.nombres = txtNombres.Text;
                usuario.fechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                usuario.sexo = ddlSexo.SelectedValue;
                //VERIFICAR LA FORMA DE QUE TOME DEL DESPLEGABLE DEL TIPO DE DOCUMENTO; OBRA SOCIAL
                //para habilitar negocio.agregarusuario(usuario)


               // usuario.tipoDocumento = TipoDocumento.Parse(ddlTipoDocumento.SelectedValue);
              
                //usuario.tipoDocumento.id =Int16.Parse (ddlTipoDocumento.SelectedValue);

                usuario.nroDocumento = Int64.Parse(txtNroDocumento.Text);
                usuario.telefono = txtTelefono.Text;
                usuario.mail = txtMail.Text;

               //usuario.obraSocial = ddlObraSocial.SelectedValue;
               // negocio.agregarusuario(usuario);

                ((List<Usuario>)Session["listaUsuarios"]).Add(usuario);


                Response.Redirect("UsuarioListado.aspx");

            }
            catch (Exception ex)
            {
                
               throw ex;
            }
            
        }

        ///agregar try y catch para que no se rompa cuando carga mal los datoss...
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = new Usuario();

                usuario.apellidos = txtApellidos.Text;
                usuario.nombres = txtNombres.Text;
                usuario.fechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                usuario.sexo = ddlSexo.SelectedValue;
                //usuario.tipoDocumento = TipoDocumento.Parse(ddlTipoDocumento.SelectedValue);
                usuario.nroDocumento = Int64.Parse(txtNroDocumento.Text);
                usuario.telefono = txtTelefono.Text;
                usuario.mail = txtMail.Text;
                //usuario.obraSocial = ddlObraSocial.SelectedValue;

                ((List<Usuario>)Session["listaUsuarios"]).Add(usuario);

                Response.Redirect("UsuarioListado.aspx");
            }
            catch (Exception ex)
            {

                //throw;
            }
            

        }

        protected void ddlPerfilusuario_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlTipoDocumento_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlPerfilusuario_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}

/*
 * Se ponen por default: 
        public Int64 id { get; set; }    
        public DateTime fechaAlta { get; set; }
        public bool activo { get; set; }
 */