/*Brian Chaves
 * December 05,2012
 * Assinment 7
 * Paitent DAL
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;

/// <summary>
/// Summary description for BCPatientDAL
/// </summary>
public class BCPatientDAL
{
    private static string patientString = ConfigurationManager.ConnectionStrings["patientSQL"].ConnectionString;
    private static SqlConnection patientConnection = new SqlConnection(patientString);
    /// <summary>
    /// selects all paitents from patient table and orders them by last name, then first name
    /// </summary>
    /// <returns>DataTable</returns>
    public static DataTable GetPatients()
    {
        string sql =
            "SELECT * , " +
                "(lastName + ', ' + firstName) AS fullName " +
            "FROM patient " +
            "ORDER BY lastName, firstName ";

        SqlDataAdapter patientAdapter = new SqlDataAdapter(sql, patientConnection);
        DataTable patientTable = new DataTable();
        try
        {
            patientAdapter.Fill(patientTable);
            return patientTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    /// <summary>
    /// constucter class not used
    /// </summary>
    public BCPatientDAL()
    {

    }
}