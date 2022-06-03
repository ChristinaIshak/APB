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
    public partial class FormAnggota : Form
    {
        FormEditAnggota form;
        public FormAnggota()
        {
            InitializeComponent();
            form = new FormEditAnggota(this);
        }

        public void Display ()
        {
            ClassDB.DisplayAndSearch("SELECT kode_anggota, nama_anggota, kelas, jk_anggota FROM anggota", dataGridView1);
        }

        private void buttonTambahAnggota_Click(object sender, EventArgs e)
        {
            FormTambahAnggota panggil = new FormTambahAnggota(this);
            panggil.ShowDialog();
            this.Hide();
        }

        private void FormAnggota_Shown(object sender, EventArgs e)
        {
            Display();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void textBoxSearch_TextChanged(object sender, EventArgs e)
        {
            ClassDB.DisplayAndSearch("SELECT kode_anggota, nama_anggota, kelas, jk_anggota FROM anggota WHERE nama_anggota LIKE'%"+ textBoxSearch.Text +"%'", dataGridView1);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == 0)
            {
                //Edit
                form.Clear();
                form.kode = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                form.nama_anggota = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                form.kelas = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
                form.jk_anggota = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                form.UpdateInfo();
                form.Show();
                return;
            }
            if(e.ColumnIndex == 1)
            {
                //delete
                if(MessageBox.Show("Are You Sure To Delete?", "Information", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) == DialogResult.Yes)
                {
                    ClassDB.DeleteAnggota(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString());
                    Display();
                }
                return;
            }
        }

        private void labelBuku_Click(object sender, EventArgs e)
        {
            FormBuku panggil = new FormBuku();
            panggil.Show();
            this.Hide();
        }

        private void labelAnggota_Click(object sender, EventArgs e)
        {
            FormAnggota panggil = new FormAnggota();
            panggil.Show();
            this.Hide();
        }

        private void labelDashboard_Click(object sender, EventArgs e)
        {
            FormDashboard panggil = new FormDashboard();
            panggil.Show();
            this.Hide();
        }

        private void labelLogout_Click(object sender, EventArgs e)
        {
            FormLogin panggil = new FormLogin();
            panggil.Show();
            this.Hide();
        }

        private void labelPeminjaman_Click(object sender, EventArgs e)
        {
            FormPengembalian panggil = new FormPengembalian();
            panggil.ShowDialog();
            this.Hide();
        }

        private void label8_Click(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {

        }
    }
}
