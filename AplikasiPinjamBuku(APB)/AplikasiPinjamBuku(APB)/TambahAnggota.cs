using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Globalization;
using System.Text.RegularExpressions;
using System.IO;

namespace AplikasiPinjamBuku_APB_
{
    public partial class TambahAnggota : Form
    {
        protected static String conString = ConfigurationManager.ConnectionStrings["apb"].ConnectionString;
        static MySqlConnection conn;
        static MySqlCommand cmd;

        public String kode_anggota { get; set; }
        public String nama_anggota { get; set; }
        public String kelas { get; set; }
        public String jk_anggota { get; set; }
        


        public TambahAnggota()
        {
            InitializeComponent();
            conn = new MySqlConnection(conString);
            cmd = new MySqlCommand();
        }

        public static DataTable SelectAll()//jadikan method static
        {
            conn = new MySqlConnection(conString);
            DataTable dt = new DataTable();
            //cara 1
            using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM anggota", conn))
            {
                try
                {
                    conn.Open();
                    MySqlDataReader rdr = cmd.ExecuteReader();
                    dt.Load(rdr);
                    conn.Close();
                }
                catch (Exception e)
                {
                    String error = e.Message;
                }
            }
            return dt;
        }

        public string insert()
        {
            string result = null;
            using (MySqlCommand cmd = new MySqlCommand("INSERT INTO anggota (nama_anggota,kelas,jk_anggota) " +
                "VALUES (@nama_anggota,@kelas,@jk_anggota)", conn))
            {
                cmd.Parameters.AddWithValue("@nama_anggota", this.nama_anggota);
                cmd.Parameters.AddWithValue("@kelas", this.kelas);
                cmd.Parameters.AddWithValue("@jk_anggota", this.jk_anggota);
                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception e)
                {
                    return e.Message;
                }
            }
            return result;
        }

        private void labelDashboard_Click(object sender, EventArgs e)
        {
            this.Hide();
            Dashboard panggil = new Dashboard();
            panggil.Show();
        }

        private void labelPeminjaman_Click(object sender, EventArgs e)
        {
            this.Hide();
            Peminjaman panggil = new Peminjaman();
            panggil.Show();
        }

        private void labelAnggota_Click(object sender, EventArgs e)
        {
            this.Hide();
            Anggota panggil = new Anggota();
            panggil.Show();
        }

        private void labelBuku_Click(object sender, EventArgs e)
        {
            this.Hide();
            Buku panggil = new Buku();
            panggil.Show();
        }

        private void labelLogout_Click(object sender, EventArgs e)
        {
            this.Hide();
            Login panggil = new Login();
            panggil.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            insert();
        }
    }
}
