using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace UAS_PEMVIS
{
    internal class ClassTP
    {
        public string id_peminjaman { get; set; }
        public string kode_anggota { get; set; }
        public string kode_buku { get; set; }
        public DateTime tgl_peminjaman { get; set; }
        public DateTime tgl_pengembalian { get; set; }


        public ClassTP(string id_peminjaman, string kode_anggota, string kode_buku, DateTime tgl_peminjaman, DateTime tgl_pengembalian)
        {
            this.id_peminjaman = id_peminjaman;
            this.kode_anggota = kode_anggota;
            this.kode_buku = kode_buku;
            this.tgl_peminjaman = tgl_peminjaman;
            this.tgl_pengembalian = tgl_pengembalian;
        }
    }
}
