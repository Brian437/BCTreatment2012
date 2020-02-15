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
public class BCPatientMedicationDAL
{
    #region variables

    private int patientMedicationId;

    public int PatientMedicationId
    {
        get { return patientMedicationId; }
        set { patientMedicationId = value; }
    }
    private string din;

    public string Din
    {
        get { return din; }
        set { din = value; }
    }

    private float dose;

    public float Dose
    {
        get { return dose; }
        set { dose = value; }
    }
    private int frequency;

    public int Frequency
    {
        get { return frequency; }
        set { frequency = value; }
    }
    private string frequencyPeriod;

    public string FrequencyPeriod
    {
        get { return frequencyPeriod; }
        set { frequencyPeriod = value; }
    }
    private string exactMinMax;

    public string ExactMinMax
    {
        get { return exactMinMax; }
        set { exactMinMax = value.Trim(); }
    }

    private int patientTreatmentId;

    public int PatientTreatmentId
    {
        get { return patientTreatmentId; }
        set { patientTreatmentId = value; }
    }

    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    #endregion

    private static string patientString = ConfigurationManager.ConnectionStrings["patientSQL"].ConnectionString;
    private static SqlConnection patientConnection = new SqlConnection(patientString);

    public BCPatientMedicationDAL()
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
    /// returns the patient medication table based on patient Id
    /// </summary>
    /// <param name="patientId"></param>
    /// <returns>patient medication table</returns>
    public static DataTable GetPatientMedications(int patientTreatmentId)
    {
        string sql =
            "SELECT medication.DIN, medication.name " +
            "FROM medication " +
                "JOIN patientMedication " +
                    "ON medication.DIN = patientMedication.DIN " +
            "WHERE patientTreatmentId = " + patientTreatmentId + " " +
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
    /// returns the patient medication table based on din and treatmentId
    /// </summary>
    /// <param name="din">din number</param>
    /// <param name="treatmentId">treatment id of the treatment</param>
    /// <returns>patient medication table</returns>
    //public static DataTable GetPatientMedication(string din, int treatmentId)
    //{
    //    string sql =
    //        "SELECT * " +
    //        "FROM medication " +
    //            "LEFT JOIN patientMedication " +
    //                "ON patientMedication.din = medication.din " +
    //            "WHERE medication.din = '" + din + "'";
    //    SqlDataAdapter patientAdapter = new SqlDataAdapter(sql, patientConnection);
    //    DataTable patientTable = new DataTable();
    //    try
    //    {
    //        patientAdapter.Fill(patientTable);
    //        return patientTable;
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    public static DataTable GetPatientMedication(string din, int patientId)
    {
        string sql =
            "SELECT * " +
            "FROM medication " +
                "JOIN patientMedication " +
                    "ON patientMedication.din = medication.din " +
                "JOIN patientTreatment " +
                    "ON patientMedication.patientTreatmentId = patientTreatment.patientTreatmentId " +
            "WHERE medication.din = '" + din + "' " +
                "AND patientId = "+patientId;
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
    /// Creates the data for Patient Medication
    /// </summary>
    /// <param name="newPatientMedication"></param>
    /// <returns></returns>
    public static Int32 Insert(BCPatientMedicationDAL newPatientMedication)
    {
        //Edit(newPatientTreatment);
        string sql =
            "INSERT INTO patientTreatment " +
            "(patientTreatmentId,din,dose,frequency,frencyPeriod,exactMinMax) " +
            "VALUES(" + newPatientMedication.patientMedicationId + ",'" + newPatientMedication.din + "'," +
            newPatientMedication.dose + "," + newPatientMedication.frequency + ",'" +
            newPatientMedication.frequencyPeriod + "','" + newPatientMedication.exactMinMax + "');";


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
    /// Deletes patient medication feild based on patient medication id
    /// </summary>
    /// <param name="patientMedicationId">patient medication id</param>
    public static void Delete(int patientMedicationId)
    {
        String sql =
            "DELETE FROM PatientMedication " +
            "WHERE patientMedicationId = " + patientMedicationId;
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
    /// Deletes patient medication feild based on patient medication id
    /// </summary>
    /// <param name="patientMedication">patient medication id</param>
    public static void Delete(BCPatientMedicationDAL patientMedication)
    {
        Delete(patientMedication.patientMedicationId);
    }

    public static Int32 Edit(BCPatientMedicationDAL newPatientMedication)
    {
        string errorMessage = Valadate(newPatientMedication);

        if (errorMessage != "")
        {
            throw new System.ArgumentException(errorMessage);
        }

        string sql =
            "UPDATE patientMedication " +
            "SET "+//din = '" + newPatientMedication.din + "'," +
                "dose = '" + newPatientMedication.dose + "', " +
                "frequency = " + newPatientMedication.frequency + ", " +
                "frequencyPeriod = '" + newPatientMedication.frequencyPeriod + "', " +
                "exactMinMax = '" + newPatientMedication.exactMinMax + "' " +
            "WHERE patientTreatmentId = " + newPatientMedication.PatientTreatmentId + ";";

        SqlCommand patientCommand = new SqlCommand(sql, patientConnection);

        try
        {
            patientConnection.Open();
            patientCommand.ExecuteNonQuery();
            //patientCommand.CommandText = "SELECT @@identity";
            return Convert.ToInt32(patientCommand.ExecuteScalar());
            //return 0;
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

    public static string Valadate(BCPatientMedicationDAL newPM)
    {
        string errorMessage="";
        if ((newPM.exactMinMax == "n/a" && newPM.frequency <= 0) ||
            (newPM.exactMinMax!="n/a" && newPM.frequency==0))
        {
            errorMessage += "exact/min/max dosn't match with frequency";
        }
        return errorMessage;
    }
}