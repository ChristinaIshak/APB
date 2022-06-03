using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UAS_PEMVIS
{
    public partial class FormDashboard : Form
    {
        public FormDashboard()
        {
           InitializeComponent();
        }

        private void labelLogout_Click(object sender, EventArgs e)
        {
            FormLogin panggil = new FormLogin();
            panggil.Show();
            this.Hide();
        }

        private void labelTotalBuku_Click(object sender, EventArgs e)
        {
           
        }

        private void FormDashboard_Load(object sender, EventArgs e)
        {

        }

        private void labelAnggota_Click(object sender, EventArgs e)
        {
            FormAnggota panggil = new FormAnggota();
            panggil.Show();
            this.Hide();
        }

        private void labelBuku_Click(object sender, EventArgs e)
        {
            FormBuku panggil = new FormBuku();
            panggil.Show();
            this.Hide();
        }

        private void labelDashboard_Click(object sender, EventArgs e)
        {
            FormDashboard panggil = new FormDashboard();
            panggil.Show();
            this.Hide();
        }

        private void labelPeminjaman_Click(object sender, EventArgs e)
        {
            
        }

        private void labelPengembalian_Click(object sender, EventArgs e)
        {
            FormPengembalian panggil = new FormPengembalian();
            panggil.Show();
            this.Hide();
        }

        private void labelPeminjaman_Click_1(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }
    }
}
