using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AplikasiPinjamBuku_APB_
{
    internal class Connection
    {
        protected String conString = ConfigurationManager.ConnectionStrings["apb"].ConnectionString;
    }
}
