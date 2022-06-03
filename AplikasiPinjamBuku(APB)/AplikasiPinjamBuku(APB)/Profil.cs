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
    public partial class Profil : Form
    {
        public Profil()
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
            EditProfil panggil = new EditProfil();
            panggil.Show();
        }

        private void label12_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void label16_Click(object sender, EventArgs e)
        {

        }

        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }
    }
}
