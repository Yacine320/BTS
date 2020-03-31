using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BelSuc
{
    class ligne_commande
    {
        private int numero;
        private int numero_ligne;
        private string reference;
        private int quantite_demandee;

        public int Numero
        {
            get { return numero; }

        }
        public int 	Numero_ligne
        {
            get { return numero_ligne; }

        }
        public string Reference
        {
            get { return reference; }

        }
        public int Quantite_demandee
        {
            get { return quantite_demandee; }

        }

    }
}
