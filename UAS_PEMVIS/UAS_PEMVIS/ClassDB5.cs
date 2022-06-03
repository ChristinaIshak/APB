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
    internal class ClassDB5
    {
        public static MySqlConnection GetConnection()
        {
            string sql = "datasource=localhost;port=3306;username=root;password=;database=apb;convert zero datetime=True";
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

        public static void UpdatePeminjaman(ClassEP std, string id)
        {
            string sql = "UPDATE peminjaman SET kode_anggota = @kode_anggota, kode_buku = @kode_buku, tgl_peminjaman = @tgl_peminjaman, tgl_pengembalian = @tgl_pengembalian, tgl_kembalikan = @tgl_kembalikan WHERE id_peminjaman = @id_peminjaman";
            MySqlConnection con = GetConnection();
            MySqlCommand cmd = new MySqlCommand(sql, con);
            DataTable dt = new DataTable();
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add("@id_peminjaman", MySqlDbType.VarChar).Value = id;
            cmd.Parameters.Add("@kode_anggota", MySqlDbType.VarChar).Value = std.kode_anggota;
            cmd.Parameters.Add("@kode_buku", MySqlDbType.VarChar).Value = std.kode_buku;
            cmd.Parameters.Add("@tgl_peminjaman", MySqlDbType.Date).Value = std.tgl_peminjaman;
            cmd.Parameters.Add("@tgl_pengembalian", MySqlDbType.Date).Value = std.tgl_pengembalian;
            cmd.Parameters.Add("@tgl_kembalikan", MySqlDbType.Date).Value = std.tgl_kembalikan;
            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Updated Successfully.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Peminjaman not update \n" + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            con.Close();
        }
    }
}
