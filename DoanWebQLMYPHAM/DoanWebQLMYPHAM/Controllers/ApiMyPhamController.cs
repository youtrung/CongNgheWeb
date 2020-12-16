﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DoanWebQLMYPHAM.Models;
namespace DoanWebQLMYPHAM.Controllers
{
   
    public class ApiMyPhamController : ApiController
    {
        QLMPDataContext db = new QLMPDataContext();
        public bool InsertMP(Sanpham s)
        {
            try
            {
                Sanpham sp = new Sanpham();
                sp.Tensp = s.Tensp;
                sp.AnhBia = s.AnhBia;
                sp.Mathuonghieu = s.Mathuonghieu;
                sp.Maxuatxu = s.Maxuatxu;
                sp.GiaBan = s.GiaBan;
                sp.MoTa = s.MoTa;
                sp.NgayCapNhat = s.NgayCapNhat;
                sp.SoLuongTon = s.SoLuongTon;
                sp.Moi = s.Moi;
                db.Sanphams.InsertOnSubmit(sp);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
