﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TurnosNegocio;
using TurnosDominio;

namespace TurnosAppWeb.Tablas
{
    public partial class PerfilUsuarioListado : System.Web.UI.Page
    {
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
                if (probando == 2) { Response.Redirect("/listados.aspx"); }

            }


            if (Session["listaPerfilesUsuarios"] == null)
            {
                PerfilUsuarioNegocio negocio = new PerfilUsuarioNegocio();
                Session.Add("listaPerfilesUsuarios", negocio.listarPerfilesUsuarios());
            }

            dgvlistaPerfilesUsuarios.DataSource = Session["listaPerfilesUsuarios"];
            dgvlistaPerfilesUsuarios.DataBind();

        }

        protected void dgvlistaPerfilesUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvlistaPerfilesUsuarios.SelectedDataKey.Value.ToString();
            Response.Redirect("PerfilUsuarioForm.aspx?id=" + id);
        }
    }
}