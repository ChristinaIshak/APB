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
    public partial class FormEditPeminjaman : Form
    {
        private readonly FormPengembalian _parent;
        public string id, kode_anggota, kode_buku, tgl_peminjaman, tgl_pengembalian, tgl_kembalikan;

        private void buttonKembali_Click(object sender, EventArgs e)
        {
            FormPengembalian form = new FormPengembalian();
            form.Show();
            this.Hide();
        }

        private void labelPeminjaman_Click(object sender, EventArgs e)
        {
            FormPengembalian panggil = new FormPengembalian();
            panggil.ShowDialog();
            this.Hide();
        }

        private void label11_Click(object sender, EventArgs e)
        {
            FormLaporan panggil = new FormLaporan();
            panggil.Show();
            this.Hide();
        }

        private void dateTimePicker3_ValueChanged(object sender, EventArgs e)
        {
            DateTime kem = dateTimePicker3.Value;
            textBox1.Text = kem.ToString();
        }

        public FormEditPeminjaman(FormPengembalian parent)
        {
            InitializeComponent();
            _parent = parent;
        }

        public void UpdateInfo()
        {
            textBoxKodeAnggota.Text = kode_anggota;
            textBoxKodeBuku.Text = kode_buku;
            dateTimePicker1.Text = tgl_peminjaman;
            dateTimePicker2.Text = tgl_pengembalian;
            textBox1.Text = tgl_kembalikan;
        }

        public void Clear()
        {
            textBoxKodeAnggota.Text = textBoxKodeBuku.Text = string.Empty;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBoxKodeAnggota.Text.Trim().Length == 0)
            {
                MessageBox.Show("Kode Anggota Kosong.");
                return;
            }
            if (textBoxKodeBuku.Text.Trim().Length == 0)
            {
                MessageBox.Show("Kode Buku Kosong.");
                return;
            }
            if (button1.Text == "Submit")
            {
                DateTime.Now.ToString("yyyy/MM/dd");
                ClassEP std = new ClassEP(textBoxKodeAnggota.Text.Trim(), textBoxKodeBuku.Text.Trim(), dateTimePicker1.Value, dateTimePicker2.Value, dateTimePicker3.Value);
                ClassDB5.UpdatePeminjaman(std, id);
            }
            _parent.Display();
        }
    }
}
