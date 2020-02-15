/* Brian Chaves
 * November 21
 * Assinment 6
 * Medication DAL
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
/// Summary description for BCCategoryDal
/// </summary>
public class BCCategoryDAL
{
	public BCCategoryDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //String connectionString = Properties.Settings.Default.databaseName;

    private static string patientString = ConfigurationManager.ConnectionStrings["patientSQL"].ConnectionString;
    private static SqlConnection patientConnection = new SqlConnection(patientString);

    /// <summary>
    /// gets the database from the Category table
    /// </summary>
    /// <returns>category table</returns>
    public static DataTable getCategories()
    {
        string sql =
            "SELECT * " +
            "FROM category " +
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