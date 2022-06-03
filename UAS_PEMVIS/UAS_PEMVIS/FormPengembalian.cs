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
    public partial class FormPengembalian : Form
    {
        FormEditPeminjaman form;
        public FormPengembalian()
        {
            InitializeComponent();
            form = new FormEditPeminjaman(this);
        }

        public void Display()
        {
            ClassDB4.DisplayAndSearch("SELECT id_peminjaman, kode_anggota, kode_buku, tgl_peminjaman, tgl_pengembalian, tgl_kembalikan FROM peminjaman", dataGridView1);
        }

        private void FormPengembalian_Shown(object sender, EventArgs e)
        {
            Display();
        }

        private void textBoxSearch_TextChanged(object sender, EventArgs e)
        {
            ClassDB4.DisplayAndSearch("SELECT id_peminjaman, kode_anggota, kode_buku, tgl_peminjaman, tgl_pengembalian, tgl_kembalikan FROM peminjaman WHERE Kode_anggota LIKE'%" + textBoxSearch.Text + "%'", dataGridView1);
        }

        private void labelPeminjaman_Click(object sender, EventArgs e)
        {
            FormPengembalian panggil = new FormPengembalian();
            panggil.ShowDialog();
            this.Hide();
        }

        private void buttonTambahAnggota_Click(object sender, EventArgs e)
        {
            FormTambahPeminjaman panggil = new FormTambahPeminjaman(this);
            panggil.Show();
            this.Hide();
            
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                //Edit
                form.Clear();
                form.id = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
                form.kode_anggota = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
                form.kode_buku = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
                form.tgl_peminjaman = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
                form.tgl_pengembalian = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
                form.tgl_kembalikan = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
                form.UpdateInfo();
                form.Show();
                return;
            }
            if (e.ColumnIndex == 1)
            {
                //delete
                if (MessageBox.Show("Are You Sure To Delete?", "Information", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) == DialogResult.Yes)
                {
                    ClassDB4.DeletePeminjaman(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString());
                    Display();
                }
                return;
            }
        }

        private void labelDashboard_Click(object sender, EventArgs e)
        {
            FormDashboard panggil = new FormDashboard();
            panggil.Show();
            this.Hide();
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

        private void labelLogout_Click(object sender, EventArgs e)
        {
            FormLogin panggil = new FormLogin();
            panggil.Show();
            this.Hide();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }
    }
}
