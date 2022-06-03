using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AplikasiPinjamBuku_APB_
{
    public partial class EditProfil : Form
    {
        public EditProfil()
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

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Profil panggil = new Profil();
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
