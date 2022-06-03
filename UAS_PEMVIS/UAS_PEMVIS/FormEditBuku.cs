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
    public partial class FormEditBuku : Form
    {
        private readonly FormBuku _parent;
        public string kode, judul_buku, penulis_buku, jumlah_buku;

        public FormEditBuku(FormBuku parent)
        {
            InitializeComponent();
            _parent = parent;
        }

        private void buttonKembali_Click(object sender, EventArgs e)
        {
            FormBuku form = new FormBuku();
            form.Show();
            this.Hide();
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

        private void buttonKembali_Click_1(object sender, EventArgs e)
        {
            FormBuku panggil = new FormBuku();
            panggil.Show();
            this.Hide();
        }

        private void labelPeminjaman_Click(object sender, EventArgs e)
        {
            FormPengembalian panggil = new FormPengembalian();
            panggil.ShowDialog();
            this.Hide();
        }

        private void label9_Click(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }

        public void UpdateInfo()
        {
            textBoxJudulBuku.Text = judul_buku;
            textBoxPenulisBuku.Text = penulis_buku;
            textBoxJumlahBuku.Text = jumlah_buku;
        }

        public void Clear()
        {
            textBoxJudulBuku.Text = textBoxPenulisBuku.Text = textBoxJumlahBuku.Text = string.Empty;
        }

        private void buttonEditBuku1_Click(object sender, EventArgs e)
        {
            if (textBoxJudulBuku.Text.Trim().Length == 0)
            {
                MessageBox.Show("Judul Buku Kosong.");
                return;
            }
            if (textBoxPenulisBuku.Text.Trim().Length == 0)
            {
                MessageBox.Show("Penulis Buku Kosong.");
                return;
            }
            if (textBoxJumlahBuku.Text.Trim().Length == 0)
            {
                MessageBox.Show("Jumlah Buku Kosong.");
                return;
            }
            if (buttonEditBuku1.Text == "Edit")
            {
                ClassEB std = new ClassEB(textBoxJudulBuku.Text.Trim(), textBoxPenulisBuku.Text.Trim(), textBoxJumlahBuku.Text.Trim());
                ClassDB3.UpdateBuku(std, kode);
            }
            _parent.Display();
        }
    }
}
