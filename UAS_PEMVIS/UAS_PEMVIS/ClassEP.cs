using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UAS_PEMVIS
{
    internal class ClassEP
    {
        public string kode_anggota { get; set; }
        public string kode_buku { get; set; }
        public DateTime tgl_peminjaman { get; set; }
        public DateTime tgl_pengembalian { get; set; }
        public DateTime tgl_kembalikan { get; set; }

        public ClassEP(string kode_anggota, string kode_buku, DateTime tgl_peminjaman, DateTime tgl_pengembalian, DateTime tgl_kembalikan)
        {
            this.kode_anggota = kode_anggota;
            this.kode_buku = kode_buku;
            this.tgl_peminjaman = tgl_peminjaman;
            this.tgl_pengembalian = tgl_pengembalian;
            this.tgl_kembalikan = tgl_kembalikan;
        }
    }
}
