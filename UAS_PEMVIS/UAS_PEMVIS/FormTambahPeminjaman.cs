using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Timers;

namespace UAS_PEMVIS
{
    public partial class FormTambahPeminjaman : Form
    {
        private readonly FormPengembalian _parent;
        public FormTambahPeminjaman(FormPengembalian parent)
        {
            InitializeComponent();
            _parent = parent;
        }

        public void Clear()
        {
            textBoxKodeAnggota.Text = textBoxIdAnggota.Text = textBoxKodeBuku.Text= string.Empty;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBoxKodeAnggota.Text.Trim().Length == 0)
            {
                MessageBox.Show("ID Peminjaman Minimal 4 Angka.");
                return;
            }
            if (textBoxIdAnggota.Text.Trim().Length == 0)
            {
                MessageBox.Show("Kode Anggota Minimal 4 Angka.");
                return;
            }
            if (textBoxKodeBuku.Text.Trim().Length == 0)
            {
                MessageBox.Show("Kode Buku Minimal 4 Angka.");
                return;
            }
            if (button1.Text == "Submit")
            {
                DateTime.Now.ToString("yyyy/MM/dd");
                ClassTP std = new ClassTP(textBoxKodeAnggota.Text.Trim(), textBoxIdAnggota.Text.Trim(), textBoxKodeBuku.Text.Trim(), dateTimePicker1.Value, dateTimePicker2.Value);
                ClassDB4.AddPeminjaman(std);
                Clear();
            }
            _parent.Display();
        }

        private void buttonKembali_Click(object sender, EventArgs e)
        {
            FormPengembalian panggil = new FormPengembalian();
            panggil.Show();
            this.Hide();
        }

        private void FormTambahPeminjaman_Load(object sender, EventArgs e)
        {
            
        }

        private void label11_Click(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }
    }
}
