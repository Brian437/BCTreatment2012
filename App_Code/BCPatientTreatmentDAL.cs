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
public class BCPatientTreatmentDAL
{
    #region variables
    private int patientTreatmentId;

    public int PatientTreatmentId
    {
        get { return patientTreatmentId; }
        set { patientTreatmentId = value; }
    }

    private int patientID;

    public int PatientID
    {
        get { return patientID; }
        set { patientID = value; }
    }
    private int treatmentID;

    public int TreatmentID
    {
        get { return treatmentID; }
        set { treatmentID = value; }
    }
    private DateTime datePrecribed;

    public DateTime DatePrecribed
    {
        get { return datePrecribed; }
        set { datePrecribed = value; }
    }
    private string comments;

    public string Comments
    {
        get { return comments; }
        set { comments = value; }
    }
    #endregion

    private static string patientString = ConfigurationManager.ConnectionStrings["patientSQL"].ConnectionString;
    private static SqlConnection patientConnection = new SqlConnection(patientString);

    public BCPatientTreatmentDAL()
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
    /// Inserts into patient Treatment
    /// </summary>
    /// <param name="newPatientTreatment"></param>
    /// <returns></returns>
    public Int32 Insert(BCPatientTreatmentDAL newPatientTreatment)
    {
        string sql = string.Format(
            "INSERT INTO patientTreatment " +
            "(patientID,treatmentId,datePrescribed) " +
            "VALUES({0},{1},'{2}'",
            newPatientTreatment.patientID, newPatientTreatment.treatmentID,
            newPatientTreatment.datePrecribed);

        SqlCommand patientCommand = new SqlCommand(sql, patientConnection);

        try
        {
            patientConnection.Open();
            patientCommand.ExecuteNonQuery();
            patientCommand.CommandText = "SELECT @@identity";
            return Convert.ToInt32(patientCommand.ExecuteScalar());
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally 
        {
            patientConnection.Close();
        }
    }

    /// <summary>
    /// deletes record based on patient treatment id
    /// </summary>
    /// <param name="patientTreatmentId">patient treatment id</param>
    public void Delete(int patientTreatmentId)
    {
        String sql =
            "DELETE FROM patientTreatment " +
            "WHERE patientTreatmentId = " + patientTreatmentId;
        SqlCommand patientCommand = new SqlCommand(sql, patientConnection);
        try
        {
            patientConnection.Open();
            patientCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            patientConnection.Close();
        }
    }

    /// <summary>
    /// deletes record based on patient id
    /// </summary>
    /// <param name="patientTreatment">patient treatment class</param>
    public void Delete(BCPatientTreatmentDAL patientTreatment)
    {
        Delete(patientTreatment.patientTreatmentId);
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
            "INNER JOIN treatmentMedication " +
                "ON medication.DIN = treatmentMedication.DIN " +
                "AND treatmentMedication.treatmentId = " + treatmentId.ToString() + " " +
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
    /// gets the patient treatment table based on patient id
    /// </summary>
    /// <param name="patientId">patient id</param>
    /// <returns>patient treatment table</returns>
    public static DataTable GetPatientTreatment(int patientId)
    {
        string sql =
            "SELECT pt.*, name " +
            "FROM patientTreatment pt " +
                "JOIN treatment t " +
                "ON pt.treatmentId = t.treatmentId " +
            "WHERE patientID = " + patientId + " " +
            "ORDER BY datePrescribed DESC ";
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