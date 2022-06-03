using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UAS_PEMVIS
{
    internal class ClassTB
    {
        public string kode_buku { get; set; }
        public string judul_buku { get; set; }
        public string penulis_buku { get; set; }
        public string jumlah_buku { get; set; }

        public ClassTB(string kode_buku, string judul_buku, string penulis_buku, string jumlah_buku)
        {
            this.kode_buku = kode_buku;
            this.judul_buku = judul_buku;
            this.penulis_buku = penulis_buku;
            this.jumlah_buku = jumlah_buku;
        }
    }
}
