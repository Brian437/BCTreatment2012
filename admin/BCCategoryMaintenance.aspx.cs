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

public partial class admin_BCCategoryMaintenance : System.Web.UI.Page
{
    //Page load event
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //Row update event
    protected void gridCategory_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    //Row deleted event
    protected void gridCategory_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

    //Adding an item
    protected void DetailsViewCategory_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
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

    //Updating a row
    protected void gridCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid)
        {
            e.Cancel = true;
        }
    }
}