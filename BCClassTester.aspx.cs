/* Brian Chaves
 * November 9,2012
 * Assinment 5
 */ 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCClassLibrary;

public partial class BCClassTester : System.Web.UI.Page
{
    BCValidator validator;
    Person[] person = new Person[8];
    /// <summary>
    /// Page load event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        validator=new BCValidator();
        person[0] = new Person("Some", "Guy", "mystery street", "Kitchener", "ON", "N1R 5P7");
        person[1] = new Person("Big", "Guy", "Homer Street", "Kitchener", "ON", "N1R 7E9");
        person[2] = new Person("Bud", "Wiser", "Cambridge street", "Cambridge", "ON", "N1R 3M5");
        person[3] = new Person("Smart", "Guy", "fake street", "Kitchener", "ON", "N1R 4J6");
        person[4] = new Person("Mystery", "Man", "mystery street", "???", "??", "A1A 1A1");
        person[5] = new Person("Visual", "Studio", "that hidden road", "Cambridge", "ON", "N1R 6Y3");
        person[6] = new Person("Brian", "Chaves", "8 Fake street", "Cambridge", "ON", "N1R 5G3");
        person[7] = new Person("That", "Guy", "Highway 8", "Kitchener", "ON", "N1R 3H8");

        List<Person> lstPerson = new List<Person>();
        for (int x = 0; x < person.Length; x++)
        {
            lstPerson.Add(person[x]);
        }
        //lstPerson.Sort();
        gridTester.DataSource = lstPerson;
        gridTester.DataBind();
    }
    /// <summary>
    /// checks for valid number
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnIsNumber_Click(object sender, EventArgs e)
    {
        if (validator.BCIsNumeric(txtTest.Text))
        {
            lblResult.Text = "IS Number: True";
        }
        else
        {
            lblResult.Text = "IS Number: False";
        }

        if (validator.BCIsInteger(txtTest.Text))
        {
            lblResult.Text += "<br /> Is Integer: True";
        }
        else
        {
            lblResult.Text += "<br /> Is Integer: False";
        }
    }
    /// <summary>
    /// Checks for date
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnIsDate_Click(object sender, EventArgs e)
    {
        if (validator.BCIsdate(txtTest.Text))
        {
            lblResult.Text = "Is Date: True";
        }
        else
        {
            lblResult.Text = "Is Date: False";
        }
    }
    /// <summary>
    /// Checks for none nulls
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnIsPresent_Click(object sender, EventArgs e)
    {
        if (validator.BCIsPresent(txtTest.Text))
        {
            lblResult.Text = "Is Present: True";
        }
        else
        {
            lblResult.Text = "Is Present: False";
        }
    }
    /// <summary>
    /// Checks for postalcode
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnIsPostalCode_Click(object sender, EventArgs e)
    {
        string strTest = txtTest.Text;
        if (validator.BCIsPostalCode(ref strTest))
        {
            lblResult.Text = "Is Postal Code: True";
        }
        else
        {
            lblResult.Text = "Is Postal Code: False";
        }
        txtTest.Text = strTest;
    }
}