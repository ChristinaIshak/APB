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
    internal class ClassDB1
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

        public static void UpdateAnggota(ClassEA std, string kode)
        {
            string sql = "UPDATE anggota SET nama_anggota = @nama_anggota, kelas = @kelas, jk_anggota = @jk_anggota WHERE kode_anggota = @kode_anggota";
            MySqlConnection con = GetConnection();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@kode_anggota", MySqlDbType.VarChar).Value = kode;
            cmd.Parameters.Add("@nama_anggota", MySqlDbType.VarChar).Value = std.nama_anggota;
            cmd.Parameters.Add("@kelas", MySqlDbType.VarChar).Value = std.kelas;
            cmd.Parameters.Add("@jk_anggota", MySqlDbType.VarChar).Value = std.jk_anggota;
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Updated Successfully.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Anggota not update \n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            con.Close();
        }
    }
}
