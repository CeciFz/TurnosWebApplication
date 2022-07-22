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
            if (Session["ingresos"] == null)
            {
                Response.Redirect("/default.aspx");
            }
            else if (Session["ingresos"] != null)
            {// no deja entrar tamp a tipo de usuario que le coloquemo probando==1?
                int probando;
                probando = int.Parse(Session["ingresos"].ToString());
                if (probando == 0) { Response.Redirect("/default.aspx"); }

            }
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
                        txtApellidos.Text = seleccionado.apellidos;
                        txtNombres.Text = seleccionado.nombres;
                        txtFechaNac.Text = seleccionado.fechaNacimiento.ToString("yyyy-MM-dd");
                        ddlSexo.SelectedValue = seleccionado.sexo;
                        ddlTipoDocumento.SelectedValue = seleccionado.tipoDocumento.id.ToString();
                        txtNroDocumento.Text = seleccionado.nroDocumento.ToString();
                        if (seleccionado.telefono != "no informado") txtTelefono.Text = seleccionado.telefono;
                        if (seleccionado.mail != "no informado") txtMail.Text = seleccionado.mail;
                        ddlObraSocial.SelectedValue = seleccionado.obraSocial.id.ToString();

                       /* if (seleccionado.perfileslUsuario[0].id == 4)
                        {
                   
                            ddlEspecialidad.SelectedValue = seleccionado.tipoDocumento.id.ToString();
                            ddlHorarios.SelectedValue = seleccionado.nroDocumento.ToString();
                        }*/

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

                if (idPerfil == 4)
                {
                    Int32 IdEsp = Int32.Parse(ddlEspecialidad.SelectedValue);
                    Int64 horario = Int64.Parse(ddlHorarios.SelectedValue);
                    negocio.agregarUsuarioConSP(usuario, idPerfil, IdEsp, horario);

                }
                else
                {
                    negocio.agregarUsuarioConSP(usuario, idPerfil);
                }

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

                usuario.id = Int64.Parse(Request.QueryString["id"].ToString());
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

                if (id == 4)
                {
                    Int32 IdEsp = Int32.Parse(ddlEspecialidad.SelectedValue);
                    Int64 horario = Int64.Parse(ddlHorarios.SelectedValue);
                    negocio.modificarUsuarioConSP(usuario, id, IdEsp, horario);

                }
                else
                {
                    negocio.modificarUsuarioConSP(usuario, id);
                }

                Session["listaUsuarios"] = null;

                Response.Redirect("UsuarioListado.aspx", false);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void ddlPerfilusuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            Int16 idPerfil = Int16.Parse(ddlPerfilusuario.SelectedValue);
            if (idPerfil == 4)
            {

                EspecialidadNegocio negocio = new EspecialidadNegocio();
                List<Especialidad> listaEspecialidades = negocio.listarEspecialidades();
                HorarioNegocio negocioH = new HorarioNegocio();
                List<Horario> listaHorarios = negocioH.listarHorariosConSP();

                ddlEspecialidad.DataSource = listaEspecialidades;
                ddlEspecialidad.DataValueField = "id";
                ddlEspecialidad.DataTextField = "descripcion";
                ddlEspecialidad.DataBind();
                ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione especialidad", "0"));
                lblEspecialidad.Visible = true;
                ddlEspecialidad.Visible = true;

                ddlHorarios.DataSource = listaHorarios;
                ddlHorarios.DataValueField = "idHorario";
                ddlHorarios.DataTextField = "descripcion";
                ddlHorarios.DataBind();
                ddlHorarios.Items.Insert(0, new ListItem("Seleccione horario", "0"));
                ddlHorarios.Visible = true;
                ddlHorarios.Visible = true;
            }
            else
            {
                lblEspecialidad.Visible = false;
                ddlEspecialidad.Visible = false;
                ddlHorarios.Visible = false;
                ddlHorarios.Visible = false;
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