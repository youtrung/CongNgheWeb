using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoanWebQLMYPHAM.Models
{
    public class CardItem
    {
        public int iMasp { get; set; }
        public string sTensp { get; set; }
        public string sAnhbia { get; set; }
        public double dDongia { get; set; }
        public int iSoluong { get; set; }
        public double ThanhTien
        {
            get { return dDongia * iSoluong; }
        }
        QLMPDataContext db = new QLMPDataContext();
        public CardItem(int masp,int sl)
        {
            Sanpham sp = db.Sanphams.Single(s => s.Masp == masp);
            if (sp != null)
            {
                iMasp = masp;
                sTensp = sp.Tensp;
                sAnhbia = sp.AnhBia;
                dDongia = Double.Parse(sp.GiaBan.ToString());
                iSoluong =sl;

            }
        }
        public CardItem(int masp)
        {
            Sanpham sp = db.Sanphams.Single(s => s.Masp == masp);
            if (sp != null)
            {
                iMasp = masp;
                sTensp = sp.Tensp;
                sAnhbia = sp.AnhBia;
                dDongia = Double.Parse(sp.GiaBan.ToString());
                iSoluong = 1;

            }
        }
    }
}