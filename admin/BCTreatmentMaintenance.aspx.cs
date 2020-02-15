/*
 * Brian Chaves
 * October 17,2012
 * Assinment 3
 */ 

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BCTreatmentMaintenance : System.Web.UI.Page
{
    //Page load event
    protected void Page_Load(object sender, EventArgs e)
    {
        int idTreatment = 0;
        int idDiganosis = 0;
        if ((Request.QueryString["TreatmentID"]) == null)
        {
            DetailsViewTreatment.DefaultMode = DetailsViewMode.Insert;
            try
            {
                idDiganosis = int.Parse(Request.QueryString["DiagnosisID"]);
                DropDownList ddDiagnosisID = (DropDownList)DetailsViewTreatment.FindControl("ddDiagnosisID");
                ddDiagnosisID.SelectedIndex = idDiganosis;
            }
            catch { }
        }
        else
        {
            DetailsViewTreatment.DefaultMode = DetailsViewMode.Edit;
            idTreatment = int.Parse(Request.QueryString["TreatmentID"]);
        }

    }

    //Item insert event
    protected void DetailsViewTreatment_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string strMessage = "Failed to Insert <br />";
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
            e.KeepInInsertMode = true;
            lblMessage.Text = strMessage;
        }
        else
        {
            lblMessage.Text = "";
            Response.Redirect("~/admin/BCTreatmentBrowse.aspx");
        }
    }

    //Update item event
    protected void DetailsViewTreatment_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string strMessage = "Failed to Edit <br />";
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
            e.KeepInEditMode = true;
            lblMessage.Text = strMessage;
        }
        else
        {
            lblMessage.Text = "";
            Response.Redirect("~/admin/BCTreatmentBrowse.aspx");
        }
    }
    protected void DetailsViewTreatment_Disposed(object sender, EventArgs e)
    {

    }

    //Button event
    protected void DetailsViewTreatment_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        //Cancle button event
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("~/admin/BCTreatmentBrowse.aspx");
        }
    }
}