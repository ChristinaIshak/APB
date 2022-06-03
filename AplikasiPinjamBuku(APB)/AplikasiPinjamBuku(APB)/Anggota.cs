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


namespace AplikasiPinjamBuku_APB_
{
    public partial class Anggota : Form
    {
        
        public Anggota()
        {
            InitializeComponent();
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

        private void labelPengembalian_Click(object sender, EventArgs e)
        {
            this.Hide();
            Pengembalian panggil = new Pengembalian();
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
            this.Hide();
            TambahAnggota panggil = new TambahAnggota();
            panggil.Show();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Profil panggil = new Profil();
            panggil.Show();
        }
    }
}
