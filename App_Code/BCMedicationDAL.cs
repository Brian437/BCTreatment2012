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
/// Summary description for BCPaientMedication
/// </summary>
public class BCMedicationDAL
{
    private static string patientString = ConfigurationManager.ConnectionStrings["patientSQL"].ConnectionString;
    private static SqlConnection patientConnection = new SqlConnection(patientString);

	public BCMedicationDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    /// <summary>
    /// Gets all the information of a brand medication
    /// </summary>
    /// <param name="din">DIN number</param>
    /// <returns>medication info</returns>
    public static DataTable GetMedication(int din)
    {
        string sql =
            "SELECT * " +
            "FROM medication " +
            "WHERE din = " + din.ToString();

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
    /// This method will get the medication table based on treatment id
    /// </summary>
    /// <param name="treatmentId">Treatment ID that is selected</param>
    /// <returns>medication table</returns>
    public static DataTable GetTreatmentMedication(int treatmentId)
    {
        string sql =
            "SELECT medication.DIN, medication.name " +
            "FROM medication " +
            "INNER JOIN treatmentMedication "+
                "ON medication.DIN = treatmentMedication.DIN "+
                "AND treatmentMedication.treatmentId = " + treatmentId.ToString() +" "+
            "ORDER BY medication.name ";
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
    /// Returns the medication table by name
    /// </summary>
    /// <returns> medication table</returns>
    public static DataTable GetMedications()
    {
        string sql =
            "SELECT medication.DIN, medication.name, typeMedication " +
            "FROM medication " +
            "ORDER BY medication.name ";
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
    /// returns the medication based on the din
    /// </summary>
    /// <param name="din"></param>
    /// <returns></returns>
    public static DataTable GetMedication(string din)
    {
        string sql =
            "SELECT * " +
            "FROM medication " +
            "WHERE din = " + din;

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