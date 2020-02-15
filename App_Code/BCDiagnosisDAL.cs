/* Brian Chaves
 * November 21
 * Assinment 6
 * Diagnosis DAL
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
/// Summary description for BCDiagnosisDAL
/// </summary>
public class BCDiagnosisDAL
{
    private static string patientString = ConfigurationManager.ConnectionStrings["patientSQL"].ConnectionString;
    private static SqlConnection patientConnection = new SqlConnection(patientString);

    public BCDiagnosisDAL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    /// <summary>
    /// Gets the database from the diagnosis table
    /// </summary>
    /// <param name="categoryId">ID of the category</param>
    /// <returns>the database from the diagnosis table</returns>
    public static DataTable GetDiagnosis(int categoryId)
    {
        string sql =
            "SELECT * " +
            "FROM diagnosis " +
            "WHERE categoryId =" + categoryId.ToString() + " " +
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
    /// <summary>
    /// Gets the database from the diagnosis table
    /// </summary>
    /// <returns>the database from the diagnosis table</returns>
    public static DataTable GetDiagnosis()
    {
        string sql =
            "SELECT * " +
            "FROM diagnosis " +
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