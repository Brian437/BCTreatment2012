using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Test_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnTest_Click(object sender, EventArgs e)
    {
        string strTest = txtTest.Text;
        if (BCIsPresent(cblTest))
        {
            lblTest.Text = "GREAT SUCCESS";
        }
        else
        {
            lblTest.Text = "EPIC FAIL";
        }
    }

    private string[] strMonth = 
            {"jan", "feb", "mar","apr", "may", "jun",
            "jul", "aug", "sep","oct", "nov", "dec" };
    public bool BCIsNumeric(string strTest)
    {
        try
        {
            float decNumber = float.Parse(strTest);
            return true;

        }
        catch
        {
            return false;
        }
    }
    public bool BCIsInteger(string strTest)
    {
        try
        {
            int intNumber = int.Parse(strTest);
            return true;
        }
        catch
        {
            return false;
        }
    }

    private bool BCIsPostalCode(ref string strTest)
    {
        Match match = Regex.Match(strTest, "^[a-zA-Z][0-9][a-zA-Z] ?[0-9][a-zA-Z][0-9]$");

        if (match.Success)
        {
            strTest = strTest.ToUpper();
            return true;
        }
        else
        {
            return false;
        }
    }

    public bool BCIsdate(string strText)
    {
        int intDay = 0;
        int intMonth = 0;
        int intYear = 0;
        string[] strSplitText;

        Match match1 = Regex.Match(strText, "^[0-9]{1,2} [a-zA-Z]{3} [0-9]{4}$");
        Match match2 = Regex.Match(strText, "^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$");

        if (match1.Success)
        {
            try
            {
                strSplitText = strText.Split(' ');
                intDay = int.Parse(strSplitText[0]);
                intMonth = MonthToInt(strSplitText[1]);
                intYear = int.Parse(strSplitText[2]);
            }
            catch
            {
                return false;
            }
        }
        else if (match2.Success)
        {
            try
            {
                strSplitText = strText.Split('/');
                intDay = int.Parse(strSplitText[0]);
                intMonth = int.Parse(strSplitText[1]);
                intYear = int.Parse(strSplitText[2]);
            }
            catch
            {
                return false;
            }
        }
        else
        {
            return false;
        }

        if (intDay > 31 || intDay < 1)
        {
            return false;
        }
        if (intMonth > 12 || intMonth < 1)
        {
            return false;
        }


        return true;
    }

    public bool BCIsPresent(string strTest)
    {
        if (strTest == null)
        {
            return false;
        }

        if (strTest.Trim() == "")
        {
            return false;
        }

        return true;
    }



    public bool BCIsPresent(RadioButtonList lstTest)
    {
        if (lstTest.SelectedIndex == -1)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    public bool BCIsPresent(CheckBoxList lstTest)
    {
        if(lstTest.SelectedIndex ==-1)
        {
            return false;
        }
        return true;
    }
    public bool BCIsPresent(DropDownList lstTest)
    {
        if (lstTest.SelectedIndex == -1)
        {
            return false;
        }
        return true;
    }
    public bool BCIsPresent(ListBox lstTest)
    {
        if (lstTest.SelectedIndex == -1)
        {
            return false;
        }
        return true;
    }


    private int MonthToInt(string strMonth)
    {
        for (int x = 0; x < 12; x++)
        {
            if (strMonth.Equals(this.strMonth[x], StringComparison.InvariantCultureIgnoreCase))
            {
                return x + 1;
            }
        }
        return -1;
    }


}