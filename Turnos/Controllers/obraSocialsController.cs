using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Turnos.Models;

namespace Turnos.Controllers
{
    public class obraSocialsController : Controller
    {
        private ProyectoNT1Entities1 db = new ProyectoNT1Entities1();

        // GET: obraSocials
        public ActionResult Index()
        {
            return View(db.obraSocials.ToList());
        }

        // GET: obraSocials/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            obraSocial obraSocial = db.obraSocials.Find(id);
            if (obraSocial == null)
            {
                return HttpNotFound();
            }
            return View(obraSocial);
        }

        // GET: obraSocials/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: obraSocials/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idObraSocial,nombre")] obraSocial obraSocial)
        {
            if (ModelState.IsValid)
            {
                db.obraSocials.Add(obraSocial);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(obraSocial);
        }

        // GET: obraSocials/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            obraSocial obraSocial = db.obraSocials.Find(id);
            if (obraSocial == null)
            {
                return HttpNotFound();
            }
            return View(obraSocial);
        }

        // POST: obraSocials/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idObraSocial,nombre")] obraSocial obraSocial)
        {
            if (ModelState.IsValid)
            {
                db.Entry(obraSocial).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(obraSocial);
        }

        // GET: obraSocials/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            obraSocial obraSocial = db.obraSocials.Find(id);
            if (obraSocial == null)
            {
                return HttpNotFound();
            }
            return View(obraSocial);
        }

        // POST: obraSocials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            obraSocial obraSocial = db.obraSocials.Find(id);
            db.obraSocials.Remove(obraSocial);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
