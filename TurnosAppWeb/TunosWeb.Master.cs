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
    }
}