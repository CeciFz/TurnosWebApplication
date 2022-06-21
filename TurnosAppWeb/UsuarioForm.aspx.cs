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
    public partial class AdministrarUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //en dll_perfilusuario  ,lo utilizamos para cargar el tipo de usuario tomtamos el dato "" comparando si es igual asocie el tipo de dato,
            //ejemplo  dll_perfilusuario  if(dll_perfilusuario="profecional")  perfil.id=4; else if 


            if (Request.QueryString["id"] != null)
            {
                Int64 id = Int64.Parse(Request.QueryString["id"].ToString());
                List<Usuario> temporal = ((List<Usuario>)Session["listaUsuarios"]);
                Usuario seleccionado = temporal.Find(x => x.id == id);
                txtApellidos.Text = seleccionado.apellidos;
                txtNombres.Text = seleccionado.nombres;
                txtFechaNac.Text = seleccionado.fechaNacimiento.ToString();
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

            Response.Redirect("Usuarios.aspx");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
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