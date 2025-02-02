﻿using ManagerApartment.Models;
using Repository.GenericRepository;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Services.Models.Response.Response.RequestRespponse;
using Domain.Entity;

namespace Repository.Repository
{
    public class RequestRepository : GenericRepository<Request>, IRequestRepository
    {
        public RequestRepository(ManagerApartmentContext context) : base(context) { }
        public async Task<List<RequestView>> GetAllRequests()
        {
            var requests = await _context.Requests
                .Include(a => a.Apartment)
                .ToListAsync();
            IQueryable<RequestView> result = (from rq in _context.Requests
                                                    join ap in _context.Apartments
                                                    on rq.ApartmentId equals ap.ApartmentId
                                                    join ow in _context.Owners
                                                    on ap.OwnerId equals ow.OwnerId
                                                    join rd in _context.RequestDetails
                                                    on rq.RequestId equals rd.RequestId
                                                    join pa in _context.Packages
                                                    on rd.PackageId equals pa.PackageId
                                                    join ao in _context.AddOns
                                                    on rq.RequestId equals ao.RequestId
                                                    select new
                                                    {
                                                        RequestId = rq.RequestId,
                                                        ApartmentId = ap.ApartmentId,
                                                        BookDateTime = (DateTime)rq.BookDateTime,
                                                        EndDateTime = (DateTime)rq.BookDateTime,
                                                        ReqStatus = rq.ReqStatus,
                                                        OwnerId = ow.OwnerId,
                                                        RequestDescription = rq.Description,
                                                        PackageRequestedId = (int)rd.PackageId,
                                                    } into reqGroup
                                                    group reqGroup by new
                                                    {
                                                        RequestId = reqGroup.RequestId,
                                                        ApartmentId = reqGroup.ApartmentId,
                                                        BookDateTime = (DateTime)reqGroup.BookDateTime,
                                                        EndDateTime = (DateTime)reqGroup.BookDateTime,
                                                        ReqStatus = reqGroup.ReqStatus,
                                                        OwnerId = reqGroup.OwnerId,
                                                        RequestDescription = reqGroup.RequestDescription,
                                                        PackageRequestedId = (int)reqGroup.PackageRequestedId,
                                                    } into countGroup
                                                    select new RequestView
                                                    {
                                                        RequestId = countGroup.Key.RequestId,
                                                        ApartmentId = countGroup.Key.ApartmentId,
                                                        BookDateTime = (DateTime)countGroup.Key.BookDateTime,
                                                        EndDateTime = (DateTime)countGroup.Key.BookDateTime,
                                                        ReqStatus = countGroup.Key.ReqStatus,
                                                        OwnerId = countGroup.Key.OwnerId,
                                                        RequestDescription = countGroup.Key.RequestDescription,
                                                        PackageRequestedId = (int)countGroup.Key.PackageRequestedId,
                                                        NumberOfAddOns = countGroup.Count()
                                                    }
                           );
            return await result.ToListAsync();
        }

        public async Task<Request> GetRequestById(int id)
        {
            return _context.Requests
                .Include(a => a.Apartment)
                .FirstOrDefault(r => r.RequestId == id);
        }

        public async Task<List<Request>> GetStaffRequests()
        {
            var result = await _context.Requests.Include(r => r.Apartment)
                                        .Include(r => r.RequestDetails).ThenInclude(rds => rds.Package)
                                        .Include(r => r.AddOns).ToListAsync();
            return result;
        }
    }
}
