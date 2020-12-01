using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoanWebQLMYPHAM.Models
{
    public class GioHang
    {
        public List<CardItem> list;
        public GioHang()
        {
            list = new List<CardItem>();
        }
        public GioHang(List<CardItem> listGH)
        {
            list = listGH;
        }
        public int SoMatHang()
        {
            if (list == null)
                return 0;
            return list.Count;
        }
        public int TongSlhang()
        {
            if (list == null)
                return 0;
            return list.Sum(t => t.iSoluong);
        }
        public double Tongthanhtien()
        {
            if (list == null)
                return 0;
            return list.Sum(t => t.ThanhTien);
        }
        public int Them(int ims,int sl)
        {
            CardItem sp = list.Find(t => t.iMasp == ims);
            if (sp == null)
            {
                CardItem product = new CardItem(ims,sl);
                if (product == null)
                    return -1;
                list.Add(product);

            }
            else
            {
                sp.iSoluong=sp.iSoluong+sl;
            }
            return 1;
        }
        public int Xoa(int ims,int sl)
        {
            CardItem sp = list.Find(t => t.iMasp == ims);
            if (sp != null)
            {
                if (sp.iSoluong - sl > 0)
                {
                    sp.iSoluong=sp.iSoluong-sl;
                }
                else
                {
                    CardItem product = new CardItem(ims,sl);
                    list.Remove(product);
                }

            }
            return 1;
        }
    }
}