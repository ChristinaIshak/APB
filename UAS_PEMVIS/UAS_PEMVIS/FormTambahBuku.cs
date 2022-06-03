using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace UAS_PEMVIS
{
    public partial class FormTambahBuku : Form
    {
        private readonly FormBuku _parent;
        public FormTambahBuku(FormBuku parent)
        {
            InitializeComponent();
            _parent = parent;
        }

        public void Clear()
        {
            textBoxKodeBuku.Text = textBoxJudulBuku.Text = textBoxPenulisBuku.Text = textBoxJumlahBuku.Text = string.Empty;
        }

        private void buttonTambahAnggota1_Click(object sender, EventArgs e)
        {
            if (textBoxKodeBuku.Text.Trim().Length == 0)
            {
                MessageBox.Show("Kode Buku Minimal 4 Angka.");
                return;
            }
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
            if (buttonTambahBuku1.Text == "Tambah")
            {
                ClassTB std = new ClassTB(textBoxKodeBuku.Text.Trim(), textBoxJudulBuku.Text.Trim(), textBoxPenulisBuku.Text.Trim(), textBoxJumlahBuku.Text.Trim());
                ClassDB2.AddBuku(std);
                Clear();
            }
            _parent.Display();
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

        private void labelPeminjaman_Click(object sender, EventArgs e)
        {
            FormPengembalian panggil = new FormPengembalian();
            panggil.ShowDialog();
            this.Hide();
        }

        private void label10_Click(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }
    }
}
