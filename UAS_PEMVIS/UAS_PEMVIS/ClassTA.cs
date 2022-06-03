using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UAS_PEMVIS
{
    internal class ClassTA
    {
        public string kode_anggota { get; set; }
        public string nama_anggota { get; set; }
        public string kelas { get; set; }
        public string jk_anggota { get; set; }

        public ClassTA(string kode_anggota, string nama_anggota, string kelas, string jk_anggota)
        {
            this.kode_anggota = kode_anggota;
            this.nama_anggota = nama_anggota;
            this.kelas = kelas;
            this.jk_anggota = jk_anggota;
        }
    }
}
