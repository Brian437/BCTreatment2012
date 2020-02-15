using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Drawing;
/*
 * Brian Chaves
 * Assinment 2
 * Sept 27
 * */
public partial class BCMedicationMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string[] strMedicationType = new string[]
            {"Pain Relief","Decongestant","Anti-Depresant",
            "Antihistamine","Bandage","Antacid",
            "Closing Wounds","Anti-Coagulant","Heart Regulation",
            "Itch Relief","Blood Thining"};

        List<string> lstMedicationType = new List<string>();

        for (int x = 0; x < strMedicationType.Length; x++)
        {
            lstMedicationType.Add(strMedicationType[x]);
        }

        lstMedicationType.Sort();

        chkListMedicationType.DataSource = lstMedicationType;
        chkListMedicationType.DataBind();

        Hashtable tblDispensing = new Hashtable();

        tblDispensing.Add("tsp", "teaspoon");
        tblDispensing.Add("mg", "miligram");
        tblDispensing.Add("tbl", "table spoon");
        tblDispensing.Add("cap", "capsoles");

        ddDispensingUnit.DataSource = tblDispensing.Values;
        ddDispensingUnit.DataBind();


        string[] strConcentrationType = new string[] { "%", "cc", "mg", "ml", "n/a", "UI" };
        List<string> lstConcentrationType = new List<string>();

        for (int x = 0; x < strConcentrationType.Length; x++)
        {
            lstConcentrationType.Add(strConcentrationType[x]);
        }

        ddConcentration.DataSource = lstConcentrationType;
        ddConcentration.DataBind();

    }
    protected void lstDispensingUnit_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strImageError = "";
        string strUploadName = "";
        string strUploadDir = Server.MapPath("~image");
        string strImageUploadMessage = "";

        Page.Validate();



        if (Page.IsValid)
        {
            strImageUploadMessage = checkForVaildImage();

            lblImageMessage.Text = strImageUploadMessage;

            if (strImageUploadMessage == "Upload Succesful")
            {
                lblImageMessage.ForeColor = Color.Black;
            }
            else
            {
                lblImageMessage.ForeColor = Color.Red;
            }
        }


    }
    private string checkForVaildImage()
    {
        string strUploadName = "";
        string strUploadDir = Server.MapPath("~image");

        try
        {
            if (upldImage.FileName == null || upldImage.FileName == "")
            {
                return "File not selected";
            }

            if (upldImage.PostedFile.ContentLength == 0)
            {
                return "Image not found";
            }

            if (txtSaveAs.Text.Trim() == "")
            {
                strUploadName = txtSaveAs.Text.Trim();
            }
            else
            {
                strUploadName = upldImage.FileName;
            }

            upldImage.PostedFile.SaveAs(strUploadDir + @"\" + strUploadName);
            return "Upload Succesful";
        }
        catch (Exception ex)
        {
            return "Image Error";
        }
    }
}