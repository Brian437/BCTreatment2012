/*Brian Chaves
 * December 05,2012
 * Assinment 7
 * Treatment DAL
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
/// Summary description for BCTreatmentDAL
/// </summary>
public class BCTreatmentDAL
{
    private static string patientString = ConfigurationManager.ConnectionStrings["patientSQL"].ConnectionString;
    private static SqlConnection patientConnection = new SqlConnection(patientString);

	public BCTreatmentDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    /// <summary>
    /// returns the treatment table based on diagnosis id
    /// </summary>
    /// <param name="diagnosisID">diagnosis id</param>
    /// <returns>treatment table</returns>
    public static DataTable GetTreatment(int diagnosisID)
    {
        string sql =
            "SELECT * " +
            "FROM treatment " +
            "WHERE diagnosisID = " + diagnosisID.ToString() + " " +
            "ORDER BY name ";
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
}