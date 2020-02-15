using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    /*
     * Brian Chaves
     * September 12,2012
     * Assinment 1
     
     * Home Page of the website
     */

    //Page load events
    protected void Page_Load(object sender, EventArgs e)
    {
        //This code will display the current date
        lblDate.Text = (DateTime.Now.ToString("dddd, dd MMM yyyy"));
    }
}