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
    public partial class FormEditAnggota : Form
    {
        private readonly FormAnggota _parent;
        public string kode, nama_anggota, kelas, jk_anggota;

        public FormEditAnggota(FormAnggota parent)
        {
            InitializeComponent();
            _parent = parent;
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

        private void label9_Click(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }

        public void UpdateInfo()
        {
            textBoxNamaAnggota.Text = nama_anggota;
            textBoxKelas.Text = kelas;
            textBoxJenisKelamin.Text = jk_anggota;
        }

        public void Clear()
        {
            textBoxNamaAnggota.Text = textBoxKelas.Text = textBoxJenisKelamin.Text = string.Empty;
        }

        private void buttonEditAnggota1_Click(object sender, EventArgs e)
        {
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
            if (buttonEditAnggota1.Text == "Edit")
            {
                ClassEA std = new ClassEA(textBoxNamaAnggota.Text.Trim(), textBoxKelas.Text.Trim(), textBoxJenisKelamin.Text.Trim());
                ClassDB1.UpdateAnggota(std,kode);
            }
            _parent.Display();
        }
    }
}
