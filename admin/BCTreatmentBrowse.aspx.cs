using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * Brian Chaves
 * October 17,2012
 * Assinment 3
 */ 

public partial class admin_BCTreatmentBrowse : System.Web.UI.Page
{
    //Page load event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                if (Request.Cookies["BCTreatment"] != null)
                {
                    if (Request.Cookies["BCTreatment"]["DiagnosisID"] != null)
                    {
                        //Gets the cookie if there is any
                        ddDiagnosisID.SelectedIndex = int.Parse(Request.Cookies["BCTreatment"]["DiagnosisID"]);
                    }
                }
            }
            catch
            {
                lblMessage.Text = "Failed to read cookie";
            }
        }
    }

    //DiagnosisID drop down box has been changed
    protected void ddDiagnosisID_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie myCookie = new HttpCookie("BCTreatment");
        myCookie["DiagnosisID"] = ddDiagnosisID.SelectedIndex.ToString();
        Response.Cookies.Add(myCookie);
    }

    //Delete row
    protected void GridViewTreatment_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        string strMessage = "Failed to Delete <br />";
        if (e.Exception != null)
        {
            if (e.Exception.InnerException != null)
            {
                strMessage += e.Exception.InnerException.Message;
            }
            else
            {
                strMessage += e.Exception.Message;
            }
            e.ExceptionHandled = true;
            lblMessage.Text = strMessage;
        }
        else
        {
            lblMessage.Text = "";
        }
    }

    //Add button click
    protected void btnAddNewTreatment_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/BCTreatmentMaintenance.aspx?"
            + "DiagnosisID="+ddDiagnosisID.SelectedIndex.ToString());
    }

    //Selecting index
    protected void GridViewTreatment_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int idTreatment = 0;
        Label lblTreatmentID = (Label)GridViewTreatment.Rows[e.NewSelectedIndex].FindControl("lblTreatmentID");
        idTreatment = int.Parse(lblTreatmentID.Text);
        Response.Redirect("~/admin/BCTreatmentMaintenance.aspx?"
            + "TreatmentID=" + idTreatment);
    }
}