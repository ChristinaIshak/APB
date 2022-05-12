using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace AplikasiPinjamBuku_APB_
{
    public partial class Login : Form
    {
       
        
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "Admin1")
            {
                if (textBox2.Text == "12345678")
                {
                    this.Hide();
                    Dashboard panggil = new Dashboard();
                    panggil.Show();
                }
                else
                {
                    MessageBox.Show("Maaf Username atau Password anda salah!", "Perhatian", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            
            else
            {
                MessageBox.Show("Maaf Username atau Password anda salah!", "Perhatian", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}

