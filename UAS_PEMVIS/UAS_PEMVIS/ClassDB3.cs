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
    internal class ClassDB3
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

        public static void UpdateBuku(ClassEB std, string kode)
        {
            string sql = "UPDATE buku SET judul_buku = @judul_buku, penulis_buku = @penulis_buku, jumlah_buku = @jumlah_buku WHERE kode_buku = @kode_buku";
            MySqlConnection con = GetConnection();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@kode_buku", MySqlDbType.VarChar).Value = kode;
            cmd.Parameters.Add("@judul_buku", MySqlDbType.VarChar).Value = std.judul_buku;
            cmd.Parameters.Add("@penulis_buku", MySqlDbType.VarChar).Value = std.penulis_buku;
            cmd.Parameters.Add("@jumlah_buku", MySqlDbType.Int32).Value = std.jumlah_buku;
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Updated Successfully.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Buku not update \n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            con.Close();
        }
    }
}
