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
    public partial class FormTambahAnggota : Form
    {
        private readonly FormAnggota _parent;

        public FormTambahAnggota(FormAnggota parent)
        {
            InitializeComponent();
            _parent = parent;
        }

        public void Clear()
        {
            textBoxKodeAnggota.Text = textBoxNamaAnggota.Text = textBoxKelas.Text = textBoxJenisKelamin.Text = string.Empty; 
        }

        private void buttonTambahAnggota1_Click(object sender, EventArgs e)
        {
           if (textBoxKodeAnggota.Text.Trim().Length == 0)
            {
                MessageBox.Show("Kode Anggota Minimal 4 Angka.");
                return;
            }
           if (textBoxNamaAnggota.Text.Trim().Length == 0)
            {
                MessageBox.Show("Nama Anggota Kosong.");
                return;
            }
           if (textBoxKelas.Text.Trim().Length == 0)
            {
                MessageBox.Show("Kelas Kosong.");
                return;
            }
           if (textBoxJenisKelamin.Text.Trim().Length == 0)
            {
                MessageBox.Show("Jenis Kelamin Kosong.");
                return;
            }
           if (buttonTambahAnggota1.Text == "Tambah")
            {
                ClassTA std = new ClassTA(textBoxKodeAnggota.Text.Trim(), textBoxNamaAnggota.Text.Trim(), textBoxKelas.Text.Trim(), textBoxJenisKelamin.Text.Trim());
                ClassDB.AddAnggota(std);
                Clear();
            }
            _parent.Display();
        }

        private void buttonKembali_Click(object sender, EventArgs e)
        {
            FormAnggota form = new FormAnggota();
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
