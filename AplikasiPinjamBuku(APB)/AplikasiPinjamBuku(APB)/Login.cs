using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Windows.Forms;


namespace AplikasiPinjamBuku_APB_
{

    public partial class Login : Form
    {
        string ConnectionString = "datasource=127.0.0.1;port=3306;username=root;password=;database=apb";

        public Login()
        {
            InitializeComponent();
        }

        public void login()
        {
            string query = "SELECT * FROM petugas WHERE username='" + textBox1.Text + "' AND pass_petugas='" + textBox2.Text + "'";
            MySqlConnection databaseConnection = new MySqlConnection(ConnectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            MySqlDataReader reader;


            databaseConnection.Open();
            reader = commandDatabase.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    MessageBox.Show("Berhasil Login Ke Dashboard");
                    Dashboard panggil = new Dashboard();
                    panggil.Show();
                    this.Hide();
                }
            }
            else
            {
                MessageBox.Show("Username atau Password Salah");
            }
            databaseConnection.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            login();
        }
    }
}

