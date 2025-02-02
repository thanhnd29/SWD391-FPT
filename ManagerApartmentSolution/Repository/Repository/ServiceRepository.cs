﻿using ManagerApartment.Models;
using Repository.GenericRepository;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class ServiceRepository : GenericRepository<Service>, IServiceRepository
    {
        public ServiceRepository(ManagerApartmentContext context) : base(context) { }
        public async Task<List<Service>> GetAllServices()
        {
            var services = await _context.Services
                .ToListAsync();
            return services;
        }

        public async Task<Service> GetServiceById(int id)
        {
            return _context.Services.FirstOrDefault(s => s.ServiceId == id);
        }
    }
}
