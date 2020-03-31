using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BelSuc
{
    class commande
    {
        private int numero;
        private int code_v;
        private int code_c;
        private string date_livraison;
        private string date_commande;
        private float total_ht;
        private float total_tva;
        private string  etat;

        public int Numero
        {
            get { return numero; }

        }
        public int Code_c
        {
            get { return code_c; }

        }
        public int Code_v
        {
            get { return code_v; }

        }
        public string Date_livraison
        {
            get { return date_livraison; }

        }
        public string Date_commande
        {
            get { return date_commande; }

        }
        public float Total_ht
        {
            get { return total_ht; }

        }
        public string Etat
        {
            get { return etat; }

        }
        

    }
}

