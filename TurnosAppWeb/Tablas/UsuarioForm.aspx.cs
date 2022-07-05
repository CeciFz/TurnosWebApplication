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
        public List<PerfilUsuario> perfil { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            TipoDocumentoNegocio tipoDocumentoNeg = new TipoDocumentoNegocio();
            ObraSocialNegocio obraSocialNeg = new ObraSocialNegocio();
            PerfilUsuarioNegocio perfilUsuarioNeg = new PerfilUsuarioNegocio();

            try
            {
                if (!IsPostBack)
                {
                    ddlTipoDocumento.DataSource = tipoDocumentoNeg.listarTiposDeDocumento();
                    ddlTipoDocumento.DataValueField = "id";
                    ddlTipoDocumento.DataTextField = "descripcion";
                    ddlTipoDocumento.DataBind();

                    ddlObraSocial.DataSource = obraSocialNeg.listarObrasSociales();
                    ddlObraSocial.DataValueField = "id";
                    ddlObraSocial.DataTextField = "descripcion";
                    ddlObraSocial.DataBind();

                    ddlPerfilusuario.DataSource = perfilUsuarioNeg.listarPerfilesUsuarios();
                    ddlPerfilusuario.DataValueField = "id";
                    ddlPerfilusuario.DataTextField = "descripcion";
                    ddlPerfilusuario.DataBind();
                    

                    if (Request.QueryString["id"] != null && btnModificar.Visible == false)
                    {   //captura el id 
                        Int64 id = Int64.Parse(Request.QueryString["id"].ToString());
                        // copia en lista temporal >> lo que hay en session
                        List<Usuario> temporal = ((List<Usuario>)Session["listaUsuarios"]);
                        //crea un objeto usuario llamado seleccionado y le copia lo que hay en la lista temporal q viene de session
                        Usuario seleccionado = temporal.Find(x => x.id == id);
                        //agrega los datos la pantalla .
                        txtId.Text = seleccionado.id.ToString();
                        txtApellidos.Text = seleccionado.apellidos;
                        txtNombres.Text = seleccionado.nombres;
                        txtFechaNac.Text = seleccionado.fechaNacimiento.ToString("yyyy-MM-dd");
                        ddlSexo.SelectedValue = seleccionado.sexo;
                        ddlTipoDocumento.SelectedValue = seleccionado.tipoDocumento.id.ToString();
                        txtNroDocumento.Text = seleccionado.nroDocumento.ToString();
                        txtTelefono.Text = seleccionado.telefono;
                        txtMail.Text = seleccionado.mail;
                        ddlObraSocial.SelectedValue = seleccionado.obraSocial.id.ToString();

                        perfil = (List<PerfilUsuario>)((List<Usuario>)Session["listaUsuarios"]).Find(x => x.id == id).perfileslUsuario;
                        ddlPerfilusuario.SelectedValue = perfil[0].id.ToString();

                        btnRegistrar.Visible = false;
                        btnModificar.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();

                usuario.apellidos = txtApellidos.Text;
                usuario.nombres = txtNombres.Text;
                usuario.fechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                usuario.sexo = ddlSexo.SelectedValue;

                usuario.tipoDocumento = new TipoDocumento();
                usuario.tipoDocumento.id = Int16.Parse(ddlTipoDocumento.SelectedValue);

                usuario.nroDocumento = Int64.Parse(txtNroDocumento.Text);
                usuario.telefono = txtTelefono.Text;
                usuario.mail = txtMail.Text;

                usuario.obraSocial = new ObraSocial();
                usuario.obraSocial.id = Int32.Parse(ddlObraSocial.SelectedValue);

                PerfilUsuario perfil = new PerfilUsuario();
                perfil.id = Int16.Parse(ddlPerfilusuario.SelectedValue);
                Int16 idPerfil = perfil.id;

                negocio.agregarUsuarioConSP(usuario, idPerfil);

                Session["listaUsuarios"] = null;

                Response.Redirect("UsuarioListado.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();

                usuario.id = Int64.Parse(txtId.Text);
                usuario.apellidos = txtApellidos.Text;
                usuario.nombres = txtNombres.Text;
                usuario.fechaNacimiento = DateTime.Parse(txtFechaNac.Text);
                usuario.sexo = ddlSexo.SelectedValue;
                usuario.tipoDocumento = new TipoDocumento();
                usuario.tipoDocumento.id = Int16.Parse(ddlTipoDocumento.SelectedValue);
                usuario.nroDocumento = Int64.Parse(txtNroDocumento.Text);
                usuario.telefono = txtTelefono.Text;
                usuario.mail = txtMail.Text;
                usuario.obraSocial = new ObraSocial();
                usuario.obraSocial.id = Int32.Parse(ddlObraSocial.SelectedValue);

                PerfilUsuario perfil = new PerfilUsuario();
                perfil.id = Int16.Parse(ddlPerfilusuario.SelectedValue);
                Int16 id = perfil.id;

                negocio.modificarUsuarioConSP(usuario, id);

                Session["listaUsuarios"] = null;

                Response.Redirect("UsuarioListado.aspx", false);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    
    }
}

/*
 * Se ponen por default: 
        public Int64 id { get; set; }    
        public DateTime fechaAlta { get; set; }
        public bool activo { get; set; }
 */