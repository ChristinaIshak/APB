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
    public partial class FormBuku : Form
    {
        FormEditBuku form;
        public FormBuku()
        {
            InitializeComponent();
            form = new FormEditBuku(this);
        }

        public void Display()
        {
            ClassDB2.DisplayAndSearch("SELECT kode_buku, judul_buku, penulis_buku, jumlah_buku FROM buku", dataGridView1);
        }

        private void FormAnggota_Shown(object sender, EventArgs e)
        {
           
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

        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                //Edit
                form.Clear();
                form.kode = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                form.judul_buku = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                form.penulis_buku = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
                form.jumlah_buku = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                form.UpdateInfo();
                form.Show();
                return;
            }
            if (e.ColumnIndex == 1)
            {
                //delete
                if (MessageBox.Show("Are You Sure To Delete?", "Information", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) == DialogResult.Yes)
                {
                    ClassDB2.DeleteBuku(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString());
                    Display();
                }
                return;
            }
        }

        private void textBoxSearch_TextChanged_1(object sender, EventArgs e)
        {
            ClassDB2.DisplayAndSearch("SELECT kode_buku, judul_buku, penulis_buku, jumlah_buku FROM buku WHERE judul_buku LIKE'%" + textBoxSearch.Text + "%'", dataGridView1);
        }

        private void FormBuku_Shown(object sender, EventArgs e)
        {
            Display();
        }

        private void buttonTambahBuku_Click(object sender, EventArgs e)
        {
            FormTambahBuku panggil = new FormTambahBuku(this);
            panggil.ShowDialog();
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
    }
}
