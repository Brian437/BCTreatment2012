using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class patientInfo_XXPatientMedication : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // c'mon ... you know what always goes here ...
    }

    #region control exception handlers

    #endregion exception handlers

    #region cascade handlers when controls are bound or a selection is changed


    #endregion cascade handlers

    // assign a treatment to the patientTreatment table for the current patient
    // - ensure a  treatment is chosen ... tell user otherwise
    // - create a patientTreatment object, populate it, and submit it to the insert
    // if it inserts correctly, 
    // - select the new record, ensure the grid synchronises ... which should force medication details into insert mode
    protected void btnPrescribeTreatment_Click(object sender, EventArgs e)
    {

    }

    // delete the selected patientTreatment record
    // - create a patientTreatment object, load its keys and submit it to the delete
    // - update listbox, select next one (if any), ensure grid syncs and that it syncs medication details
    protected void btnDeletePatientTreatment_Click(object sender, EventArgs e)
    {

    }

    // on insert, force the patientTreatmentId in the patientMedication object to the currently selected one
    protected void dvPatientMedication_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {

    }

    // on update, user may have changed the medication din
    // we need to add the old din to the new values being sent to the object
    protected void gvPatientMedication_SelectedIndexChanged(object sender, EventArgs e)
    {
        dsPatientMedication.DataBind();
    }
    protected void dvPatientMedication_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {

    }
    protected void dvPatientMedication_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

    }
    protected void dvPatientMedication_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            if (e.Exception.InnerException != null)
            {
                lblMessage.Text = e.Exception.InnerException.Message;
            }
            else
            {
                lblMessage.Text = e.Exception.Message;
            }

            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}