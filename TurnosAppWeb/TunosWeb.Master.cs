using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TurnosAppWeb
{
    public partial class TunosWeb : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          // int probando;
           

            if (Session["ingresos"] != null)
            { 
                btnCerrarsession.Visible = true;

                //probando = int.Parse(Session["ingresos"].ToString());
            }else  if (Session["ingresos"] == null) { btnCerrarsession.Visible = false; }

        }

        


protected void btnCerrarsession_Click(object sender, EventArgs e)
        {
            Session["ingresos"] = null;
            
            Response.Redirect("/default.aspx");
        }

        
        protected void home_Click(object sender, EventArgs e)
        {
            if (Session["ingresos"] == null)
            {
                Response.Redirect("/default.aspx");
            }
            else if (Session["ingresos"] != null)
            {// no deja entrar tamp a tipo de usuario que le coloquemo probando==1?
                int probando;
                probando = int.Parse(Session["ingresos"].ToString());
                if (probando == 1) { Response.Redirect("/Tablas/menuadmin.aspx"); }
                else if (probando == 2) { Response.Redirect("/Tablas/menugestion.aspx"); }
                else if (probando == 3) { Response.Redirect("/Tablas/menuprofesional.aspx"); }
                else if (probando == 4) { Response.Redirect("/Tablas/menupaciente.aspx"); }

            }

        }
    }
}