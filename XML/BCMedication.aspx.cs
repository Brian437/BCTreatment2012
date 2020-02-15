/*Brian Chaves
 * October 31
 * Assinment 4
 * XML database
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class BCMedication : System.Web.UI.Page
{
    /// <summary>
    /// Page load event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {

        //Reads from the XML Document
        XDocument xmlMedication = XDocument.Load(Server.MapPath("~/XML/medication.xml"));
        var lstMedication = from medication in xmlMedication.Descendants("medication")
                            from onhand in medication.Descendants("onhand")
                            where onhand.Value != "0"
                            select new
                            {
                                Din = medication.Attribute("din").Value,
                                Name = medication.Element("name").Value,
                                ImageLocation = medication.Element("image").Value,
                                Category = medication.Element("category").Value,
                                Units = medication.Element("units").Value,
                                Concentration = medication.Element("concentration").Value,

                                OnHand = onhand.Value,
                            };


        if (!Page.IsPostBack)
        {
            //gets the category and place them in the dropdown box
            var lstCategory = from medication in lstMedication
                              group medication by new
                              {
                                  medication.Category,
                              } into list
                              orderby list.Key.Category
                              select new
                              {
                                  Category = list.Key.Category
                              };

            ddCategory.SelectedValue = "pain relief";

            ddCategory.DataSource = lstCategory;
            ddCategory.DataBind();
        }

        //Places the list item into the grid view
        var lstMedicationSummary = from medication in lstMedication
                                   where medication.Category == ddCategory.SelectedValue
                                   group medication by new
                                   {
                                       medication.Din,
                                       medication.Name,
                                       medication.ImageLocation,
                                       medication.Category,
                                       medication.Units,
                                       medication.Concentration,

                                   } into list
                                   orderby list.Sum(i => Convert.ToInt32(i.OnHand)) descending
                                   select new
                                   {
                                       Din = list.Key.Din,
                                       Name = list.Key.Name,
                                       ImageLocation = list.Key.ImageLocation,
                                       Category = list.Key.Category,
                                       Units = list.Key.Units,
                                       Concentration = list.Key.Concentration,

                                       MedicationConcentration = list.Key.Din + ": " + list.Key.Name
                                            + "\r\n" + list.Key.Concentration,
                                       TotalOnHand = list.Sum(i => Convert.ToInt32(i.OnHand))

                                   };




        gridViewMedication.DataSource = lstMedicationSummary;
        gridViewMedication.DataBind();
    }
}