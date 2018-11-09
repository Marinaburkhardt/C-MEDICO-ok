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
    public class pacientesController : Controller
    {
        private ProyectoNT1Entities1 db = new ProyectoNT1Entities1();

        // Volver al menú principal
        public ActionResult MenuPrincipal()
        {
            //HAY QUE HACER Q DEVUELVA LA VISTA HOME.INDEX
            return View();
        }

        // GET: pacientes
        public ActionResult Index()
        {
            var pacientes = db.pacientes.Include(p => p.obraSocial);
            return View(pacientes.ToList());
        }

        // GET: pacientes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            paciente paciente = db.pacientes.Find(id);
            if (paciente == null)
            {
                return HttpNotFound();
            }
            return View(paciente);
        }

        // GET: pacientes/Create
        public ActionResult Create()
        {
            ViewBag.idObraSocial = new SelectList(db.obraSocials, "idObraSocial", "nombre");
            return View();
        }

        // POST: pacientes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPaciente,nombre,apellido,dni,telefono,mail,idObraSocial,sexo")] paciente paciente)
        {
            if (ModelState.IsValid)
            {
                db.pacientes.Add(paciente);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idObraSocial = new SelectList(db.obraSocials, "idObraSocial", "nombre", paciente.idObraSocial);
            return View(paciente);
        }

        // GET: pacientes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            paciente paciente = db.pacientes.Find(id);
            if (paciente == null)
            {
                return HttpNotFound();
            }
            ViewBag.idObraSocial = new SelectList(db.obraSocials, "idObraSocial", "nombre", paciente.idObraSocial);
            return View(paciente);
        }

        // POST: pacientes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPaciente,nombre,apellido,dni,telefono,mail,idObraSocial,sexo")] paciente paciente)
        {
            if (ModelState.IsValid)
            {
                db.Entry(paciente).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idObraSocial = new SelectList(db.obraSocials, "idObraSocial", "nombre", paciente.idObraSocial);
            return View(paciente);
        }

        // GET: pacientes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            paciente paciente = db.pacientes.Find(id);
            if (paciente == null)
            {
                return HttpNotFound();
            }
            return View(paciente);
        }

        // POST: pacientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            paciente paciente = db.pacientes.Find(id);
            db.pacientes.Remove(paciente);
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
