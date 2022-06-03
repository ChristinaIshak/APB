using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace UAS_PEMVIS
{
    internal class ClassDB
    {
       public static MySqlConnection GetConnection()
       {
            string sql = "datasource=localhost;port=3306;username=root;password=;database=apb";
            MySqlConnection con = new MySqlConnection(sql);
            try
            {
                con.Open();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("MySql Connection! \n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return con;
       }

        public static void AddAnggota(ClassTA std)
        {
            string sql = "INSERT INTO anggota VALUES (@kode_anggota, @nama_anggota, @kelas, @jk_anggota)";
            MySqlConnection con = GetConnection();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@kode_anggota", MySqlDbType.VarChar).Value = std.kode_anggota;
            cmd.Parameters.Add("@nama_anggota", MySqlDbType.VarChar).Value = std.nama_anggota;
            cmd.Parameters.Add("@kelas", MySqlDbType.VarChar).Value = std.kelas;
            cmd.Parameters.Add("@jk_anggota", MySqlDbType.VarChar).Value = std.jk_anggota;
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Added Successfully.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Anggota not insert. \n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            con.Close();
        }

        public static void DeleteAnggota(string kode)
        {
            string sql = "DELETE FROM anggota WHERE kode_anggota = @kode_anggota";
            MySqlConnection con = GetConnection();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@kode_anggota", MySqlDbType.VarChar).Value = kode;
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Deleted Successfully.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Anggota not delet \n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            con.Close();
        }

        public static void DisplayAndSearch(string query, DataGridView dgv)
        {
            string sql = query;
            MySqlConnection con = GetConnection();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
            DataTable tbl = new DataTable();
            adp.Fill(tbl);
            dgv.DataSource = tbl;
            con.Close();
        }
    }
}
