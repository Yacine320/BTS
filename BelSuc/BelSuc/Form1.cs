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
using Dapper;

namespace BelSuc
{
    public partial class Form1 : Form
    {
        string _connectionString = "Server=127.0.0.1; Database=sucrerie; UID=root; Pwd=";
        public string Table;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var combochoixsource = new List<Combosource>();
            combochoixsource.Add(new Combosource() { id = 0, libelle = "" });
            combochoixsource.Add(new Combosource() { id = 1, libelle = "client" });
            combochoixsource.Add(new Combosource() { id = 2, libelle = "commande" });
            combochoixsource.Add(new Combosource() { id = 3, libelle = "ligne_commande" });
            combochoixsource.Add(new Combosource() { id = 4, libelle = "produit" }); 
            combochoixsource.Add(new Combosource() { id = 5, libelle = "vendeur" });
            comboBox1.DataSource = combochoixsource;
            comboBox1.DisplayMember = "libelle";
          



        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Nom;
            string Ville;
            var Item = (Combosource)comboBox1.SelectedItem;

            if (Item.id != 0)
            {
                MySqlConnection connection = new MySqlConnection(_connectionString);

                connection.Open();


                try
                {

                    switch (Item.libelle)
                    {

                        case "client":

                            {
                                switch (textBox1.Text)
                                {
                                    case "":
                                        {
                                            if (textBox2.Text == "")
                                            {
                                                switch (textBox2.Text)

                                                {

                                                    case "":
                                                        {
                                                           
                                                            string sql = "SELECT * FROM  client";
                                                            MySqlCommand cmd = new MySqlCommand(sql, connection);
                                                            var DataContacts = connection.Query<client>(sql).ToList();
                                                            dataGridView1.DataSource = DataContacts;

                                                            label1.Text = "Nom";
                                                            label2.Text = "Ville";

                                                        }
                                                        break;

                                                    default:
                                                        {
                                                            Ville = textBox2.Text;
                                                            Nom = textBox1.Text;
                                                            string sql = "SELECT * FROM  client WHERE Ville='" + Ville + "'";
                                                            MySqlCommand cmd = new MySqlCommand(sql, connection);
                                                            var DataContacts = connection.Query<client>(sql).ToList();
                                                            dataGridView1.DataSource = DataContacts;



                                                            label1.Text = "Nom";
                                                            label2.Text = "Ville";

                                                        }
                                                        break;
                                                }
                                                
                                            }
                                          





                                        }
                                        break;

                                        
                                

                                            else
                                            {
                                            {
                                                switch (textBox2.Text)

                                                {
                                                    case "":
                                                        {
                                                            Nom = textBox1.Text;
                                                            string sql = "SELECT * FROM  client WHERE Nom='" + Nom + "'";
                                                            MySqlCommand cmd = new MySqlCommand(sql, connection);
                                                            var DataContacts = connection.Query<client>(sql).ToList();
                                                            dataGridView1.DataSource = DataContacts;
                                                        }
                                                        break;

                                                }
                                                break;
                                            }

                                           
                                        }
                                        

                                }
                            }
                            break;
                        /* if ((textBox1.Text == "") && (textBox2.Text == ""))
                         {
                             string sql = "SELECT * FROM  client";
                             MySqlCommand cmd = new MySqlCommand(sql, connection);
                             var DataContacts = connection.Query<client>(sql).ToList();
                             dataGridView1.DataSource = DataContacts;



                             label1.Text = "Nom";
                             label2.Text = "Ville";

                         }
                         else if (textBox2.Text == "")
                         {
                             Nom = textBox1.Text;
                             string sql = "SELECT * FROM  client WHERE Nom='" + Nom + "'";
                             MySqlCommand cmd = new MySqlCommand(sql, connection);
                             var DataContacts = connection.Query<client>(sql).ToList();
                             dataGridView1.DataSource = DataContacts;



                             label1.Text = "Nom";
                             label2.Text = "Ville";
                         }
                         else

                         {
                             Ville = textBox2.Text;
                             Nom = textBox1.Text;
                             string sql = "SELECT * FROM  client WHERE Ville='" + Ville + "'";
                             MySqlCommand cmd = new MySqlCommand(sql, connection);
                             var DataContacts = connection.Query<client>(sql).ToList();
                             dataGridView1.DataSource = DataContacts;



                             label1.Text = "Nom";
                             label2.Text = "Ville";
                         }
                     }



                     break;
                     /*/

                        case "commande":


                            {
                                if ((textBox1.Text == "") && (textBox2.Text == ""))
                                {

                                    string sql = "SELECT * FROM  commande";
                                    MySqlCommand cmd = new MySqlCommand(sql, connection);
                                    var DataContacts = connection.Query<commande>(sql).ToList();
                                    dataGridView1.DataSource = DataContacts;

                                    label1.Text = "Numero";
                                    label2.Text = "Date_livraison";
                                }
                                else if (textBox2.Text == "")
                                {
                                    Nom = textBox1.Text;
                                    string sql = "SELECT * FROM  client WHERE Nom='" + Nom + "'";
                                    MySqlCommand cmd = new MySqlCommand(sql, connection);
                                    var DataContacts = connection.Query<client>(sql).ToList();
                                    dataGridView1.DataSource = DataContacts;



                                    label1.Text = "Nom";
                                    label2.Text = "Ville";
                                }
                                else

                                {
                                    Ville = textBox2.Text;
                                    Nom = textBox1.Text;
                                    string sql = "SELECT * FROM  client WHERE Ville='" + Ville + "'";
                                    MySqlCommand cmd = new MySqlCommand(sql, connection);
                                    var DataContacts = connection.Query<client>(sql).ToList();
                                    dataGridView1.DataSource = DataContacts;



                                    label1.Text = "Nom";
                                    label2.Text = "Ville";
                                }}
                                break;
                        case "ligne_commande":

                            {


                                string sql = "SELECT * FROM  ligne_commande";
                                MySqlCommand cmd = new MySqlCommand(sql, connection);
                                var DataContacts = connection.Query<ligne_commande>(sql).ToList();
                                dataGridView1.DataSource = DataContacts;

                                label1.Text = "Reference";
                                label2.Text = "Quantite_demandee";



                            }



                            break;
                        case "produit":

                            {


                                string sql = "SELECT * FROM  produit";
                                MySqlCommand cmd = new MySqlCommand(sql, connection);
                                var DataContacts = connection.Query<produit>(sql).ToList();
                                dataGridView1.DataSource = DataContacts;

                                label1.Text = "reference";
                                label2.Text = "designation";

                            }



                            break;
                        case "vendeur":

                            {


                                string sql = "SELECT * FROM  vendeur";
                                MySqlCommand cmd = new MySqlCommand(sql, connection);
                                var DataContacts = connection.Query<vendeur>(sql).ToList();
                                dataGridView1.DataSource = DataContacts;


                                label1.Text = "nom";
                                label2.Text = "ville";


                            }



                            break;
                    }


                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)

            
            


        {
            if (comboBox1.ValueMember == "client")
            {

                MessageBox.Show("Bon");
            }
            else if (comboBox1.ValueMember == "commande")
            {

                MessageBox.Show("Bon");
            }
            else if (comboBox1.ValueMember == "ligne_commande")
            {

                MessageBox.Show("Bon");
            }
            else if (comboBox1.ValueMember == "")
            {

                MessageBox.Show("Bon");
            }

        }

        
    }
}

