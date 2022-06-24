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
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            if (!IsPostBack)
            {

                List<Usuario> listausuarios = negocio.listarUsuarios();
                Session["listaUsuarios"] = listausuarios;
                dgvlistaUsuarios.DataSource = Session["listaUsuarios"];
                dgvlistaUsuarios.DataBind();


            }
            /*if (Session["listaUsuarios"] == null)
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                Session.Add("listaUsuarios", negocio.listarUsuarios());
            }

            dgvlistaUsuarios.DataSource = Session["listaUsuarios"];
            dgvlistaUsuarios.DataBind();   
            */
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            
            if (txtbuscaru.Text != "")
            {
             //  long dni = long.Parse(txtbuscaru.Text);
                string dni = txtbuscaru.Text;

                dgvlistaUsuarios.DataSource = ((List<Usuario>)Session["listaUsuarios"]).FindAll(x => x.nroDocumento.ToString() == dni);
                dgvlistaUsuarios.DataBind();
            }
           else 
            {
                dgvlistaUsuarios.DataSource = Session["listaUsuarios"];
                dgvlistaUsuarios.DataBind();

            }

        }

        protected void listacontactos_SelectedIndexChanged(object sender, EventArgs e)
        {//pasaje por url
            var id = dgvlistaUsuarios.SelectedDataKey.Value.ToString();
            Response.Redirect("UsuarioForm.aspx?id=" + id);
        }
    }
}