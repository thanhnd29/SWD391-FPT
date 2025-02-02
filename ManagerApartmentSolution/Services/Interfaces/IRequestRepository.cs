﻿using Domain.Entity;
using ManagerApartment.Models;
using Services.Interfaces.IGenericRepository;
using Services.Models.Response.Response.RequestRespponse;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Interfaces
{
    public interface IRequestRepository : IGenericRepository<Request>
    {
        Task<List<RequestView>> GetAllRequests();
        Task<Request> GetRequestById(int id);
        Task<List<Request>> GetStaffRequests();
    }
}
