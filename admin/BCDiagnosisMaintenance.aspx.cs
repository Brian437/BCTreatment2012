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

public partial class admin_BCDiagnosisMaintenance : System.Web.UI.Page
{
    //Page load event
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridViewDiagnosis.Sort("Name", SortDirection.Ascending);
        }
    }

    //deleting a row event
    protected void GridViewDiagnosis_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

    //Row updated event
    protected void GridViewDiagnosis_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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
        }
    }

    //Row updating event
    protected void GridViewDiagnosis_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid)
        {
            e.Cancel = true;
        }
    }

    //after adding an item
    protected void DetailsViewDiagnosis_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
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
            lblMessage.Text = strMessage;
        }
        else
        {
            lblMessage.Text = "";
        }
    }

    //before adding an item
    protected void DetailsViewDiagnosis_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (e.Values["name"] == null || e.Values["name"].ToString().Trim() == "")
        {
            e.Cancel = true;

            lblMessage.Text = "Failed to Insert <br />" +
                "Name cannot be blank";
            Label lblNameRequired = (Label)DetailsViewDiagnosis.FindControl("lblNameRequired");
            lblNameRequired.Visible = true;
        }
    }
}