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
using MySql.Data.MySqlClient;

namespace UAS_PEMVIS
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        string connentionString = "datasource=127.0.0.1;port=3306;username=root;password=;database=apb;";

        public void login()
        {
            string query = "SELECT * FROM petugas WHERE username='" + textBoxUsername.Text + "' AND pass_petugas='" + textBoxPassword.Text + "'";
            MySqlConnection databaseConnection = new MySqlConnection(connentionString);
            MySqlCommand commandDatabase = new MySqlCommand(query, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            MySqlDataReader reader;

            try
            {
                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        MessageBox.Show("Login Berhasil");
                        FormDashboard panggil = new FormDashboard();
                        panggil.Show();
                        this.Hide();
                    }
                }
                else
                {
                    MessageBox.Show("Username atau Password Anda Salah");
                }
                databaseConnection.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            login();
        }
    }
}
