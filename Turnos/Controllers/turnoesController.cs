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
    public class turnoesController : Controller
    {
        private ProyectoNT1Entities1 db = new ProyectoNT1Entities1();

        // GET: turnoes
        public ActionResult Index()
        {
            var turnoes = db.turnoes.Include(t => t.paciente).Include(t => t.profesional);
            return View(turnoes.ToList());
        }

        // GET: turnoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            turno turno = db.turnoes.Find(id);
            if (turno == null)
            {
                return HttpNotFound();
            }
            return View(turno);
        }

        // GET: turnoes/Create
        public ActionResult Create()
        {
            ViewBag.idPaciente = new SelectList(db.pacientes, "idPaciente", "nombre");
            ViewBag.idPaciente = new SelectList(db.profesionals, "idProfesional", "nombre");
            return View();
        }

        // POST: turnoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPaciente,idProfesional,fecha")] turno turno)
        {
            if (ModelState.IsValid)
            {
                db.turnoes.Add(turno);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Pacientes = new SelectList(db.pacientes, "idPaciente", "nombre", turno.idPaciente).AsEnumerable<SelectListItem>();
            ViewBag.Profesionales = new SelectList(db.profesionals, "idProfesional", "nombre", turno.idProfesional).AsEnumerable<SelectListItem>();
            return View(turno);
        }

        

        // GET: turnoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            turno turno = db.turnoes.Find(id);
            if (turno == null)
            {
                return HttpNotFound();
            }
            ViewBag.idPaciente = new SelectList(db.pacientes, "idPaciente", "nombre", turno.idPaciente);
            ViewBag.idPaciente = new SelectList(db.profesionals, "idProfesional", "nombre", turno.idPaciente);
            return View(turno);
        }

        // POST: turnoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPaciente,idProfesional,fecha")] turno turno)
        {
            if (ModelState.IsValid)
            {
                db.Entry(turno).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idPaciente = new SelectList(db.pacientes, "idPaciente", "nombre", turno.idPaciente);
            ViewBag.idPaciente = new SelectList(db.profesionals, "idProfesional", "nombre", turno.idPaciente);
            return View(turno);
        }

        // GET: turnoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            turno turno = db.turnoes.Find(id);
            if (turno == null)
            {
                return HttpNotFound();
            }
            return View(turno);
        }

        // POST: turnoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            turno turno = db.turnoes.Find(id);
            db.turnoes.Remove(turno);
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
