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
    public partial class UsuarioListado : System.Web.UI.Page
    {
        public List<Usuario> listaUsuarios { get; set; }
        public List<PerfilUsuario> perfil { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["listaUsuarios"] == null)
                {
                    UsuarioNegocio negocio = new UsuarioNegocio();
                    listaUsuarios = negocio.listarUsuarios();
                    Session.Add("listaUsuarios", listaUsuarios);
                }

               // repUsuario.DataSource = ((List<Usuario>)Session["listaUsuarios"]).FindAll(x => x.id == 1);
               // repUsuario.DataBind();

            }

            perfil = (List<PerfilUsuario>)((List<Usuario>)Session["listaUsuarios"]).Find(x => x.id == 1).perfileslUsuario;

            dgvlistaUsuarios.DataSource = Session["listaUsuarios"];
            dgvlistaUsuarios.DataBind();

        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            
            if (txtbuscaru.Text != "")
            {
             //  long dni = long.Parse(txtbuscaru.Text);
                string dni = txtbuscaru.Text;

                dgvlistaUsuarios.DataSource = ((List<Usuario>)Session["listaUsuarios"]).FindAll(x => x.nroDocumento.ToString() == dni);
                dgvlistaUsuarios.DataBind();

                repUsuario.DataSource = ((List<Usuario>)Session["listaUsuarios"]).FindAll(x => x.nroDocumento.ToString() == dni);
                repUsuario.DataBind();
            }
           else 
            {
                dgvlistaUsuarios.DataSource = Session["listaUsuarios"];
                dgvlistaUsuarios.DataBind();

                repUsuario.DataBind();
            }

        }

        protected void listacontactos_SelectedIndexChanged(object sender, EventArgs e)
        {//pasaje por url
            string id = dgvlistaUsuarios.SelectedDataKey.Value.ToString();
            //Response.Redirect("UsuarioForm.aspx?id=" + id);

            repUsuario.DataSource = ((List<Usuario>)Session["listaUsuarios"]).FindAll(x => x.id.ToString() == id);
            repUsuario.DataBind();

            perfil = (List<PerfilUsuario>)((List<Usuario>)Session["listaUsuarios"]).Find(x => x.id.ToString() == id).perfileslUsuario;

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("UsuarioForm.aspx?id=" + id);
        }

        protected void dgvlistaUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvlistaUsuarios.PageIndex = e.NewPageIndex;
            dgvlistaUsuarios.DataBind();

            repUsuario.DataBind();
        }
    }
}