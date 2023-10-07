﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using ManagerApartment.Models;
using Services.Models.Response.AddOnResponse;
using Services.Models.Response.ApartmentResponse;
using Services.Models.Response.Asset;
using Services.Models.Response.Bill;
using Services.Models.Response.BuildingResponse;
using Services.Models.Response.ContractResponse;
using Services.Models.Response.OwnerResponse;
using Services.Models.Response.PackageResponse;
using Services.Models.Response.RequestRespponse;
using Services.Models.Response.ServiceResponse;
using Services.Models.Response.StaffResponse;
using Services.Models.Response.TennantResponse;

namespace Services.AutoMappers
{
    public class ApplicationMapper : Profile
    {
        public ApplicationMapper()
        {
            CreateMap<AddOn, ResponseOfAddOn>()
                .ForMember(re => re.AddOnId, act => act.MapFrom(src => src.AddOnId))
                .ForMember(re => re.RequestId, act => act.MapFrom(src => src.RequestId))
                .ForMember(re => re.RequestDescription, act => act.MapFrom(src => src.Request.Description))
                .ForMember(re => re.RequestBookDate, act => act.MapFrom(src => src.Request.BookDateTime))
                .ForMember(re => re.ServiceId, act => act.MapFrom(src => src.ServiceId))
                .ForMember(re => re.ServiceName, act => act.MapFrom(src => src.Service.Name))
                .ForMember(re => re.ServicePrice, act => act.MapFrom(src => src.Service.Price))
                .ForMember(re => re.AddonAmount, act => act.MapFrom(src => src.Amount))
                .ForMember(re => re.AddOnPrice, act => act.MapFrom(src => src.Price))
                .ForMember(re => re.AddOnStatus, act => act.MapFrom(src => src.Status));

            CreateMap<Apartment, ResponseOfApartment>()
                .ForMember(re => re.ApartmentId, act => act.MapFrom(src => src.ApartmentId))
                .ForMember(re => re.ApartmentTypeId, act => act.MapFrom(src => src.ApartmentTypeId))
                .ForMember(re => re.BuildingId, act => act.MapFrom(src => src.BuildingId))
                .ForMember(re => re.BuildingName, act => act.MapFrom(src => src.Building.Name))
                .ForMember(re => re.BuildingAddress, act => act.MapFrom(src => src.Building.Address))
                .ForMember(re => re.OwnerId, act => act.MapFrom(src => src.OwnerId))
                .ForMember(re => re.OwnerName, act => act.MapFrom(src => src.Owner.Name))
                .ForMember(re => re.FromDate, act => act.MapFrom(src => src.FromDate))
                .ForMember(re => re.ToDate, act => act.MapFrom(src => src.ToDate))
                .ForMember(re => re.Sequence, act => act.MapFrom(src => src.Sequence))
                .ForMember(re => re.ApartmentStatus, act => act.MapFrom(src => src.ApartmentStatus));

            CreateMap<ApartmentType, ResponseOfApartmentType>()
                .ForMember(re => re.ApartmentTypeId, act => act.MapFrom(src => src.ApartmentTypeId))
                .ForMember(re => re.BuildingId, act => act.MapFrom(src => src.Building.BuildingId))
                .ForMember(re => re.BuildingName, act => act.MapFrom(src => src.Building.Name))
                .ForMember(re => re.BuildingAddress, act => act.MapFrom(src => src.Building.Address))
                .ForMember(re => re.ApartmentTypeName, act => act.MapFrom(src => src.Name))
                .ForMember(re => re.ApaermentTypeDescription, act => act.MapFrom(src => src.Description))
                .ForMember(re => re.Status, act => act.MapFrom(src => src.Status));

            CreateMap<Asset, ResponseOfAsset>()
                .ForMember(re => re.AssetId, act => act.MapFrom(src => src.AssetId))
                .ForMember(re => re.AssetHistoryId, act => act.MapFrom(src => src.AssetHistoryId))
                .ForMember(re => re.ApartmentId, act => act.MapFrom(src => src.ApartmentId))
                .ForMember(re => re.AssetName, act => act.MapFrom(src => src.Name))
                .ForMember(re => re.Quantity, act => act.MapFrom(src => src.Quantity))
                .ForMember(re => re.AssetDescription, act => act.MapFrom(src => src.Description))
                .ForMember(re => re.ItemImage, act => act.MapFrom(src => src.ItemImage))
                .ForMember(re => re.AssetStatus, act => act.MapFrom(src => src.Status));

            CreateMap<AssetHistory, ResponseOfAssetHistory>()
                .ForMember(re => re.AssetHistoryId, act => act.MapFrom(src => src.AssetHistoryId))
                .ForMember(re => re.Code, act => act.MapFrom(src => src.Code))
                .ForMember(re => re.Date, act => act.MapFrom(src => src.Date))
                .ForMember(re => re.Quantity, act => act.MapFrom(src => src.Quantity))
                .ForMember(re => re.Description, act => act.MapFrom(src => src.Description))
                .ForMember(re => re.ItemImage, act => act.MapFrom(src => src.ItemImage))
                .ForMember(re => re.Status, act => act.MapFrom(src => src.Status));

            CreateMap<Bill, ResponseOfBill>()
                .ForMember(re => re.BillId, act => act.MapFrom(src => src.BillId))
                .ForMember(re => re.RequestId, act => act.MapFrom(src => src.RequestId))
                .ForMember(re => re.ApartmentId, act => act.MapFrom(src => src.Request.ApartmentId))
                .ForMember(re => re.BillDescription, act => act.MapFrom(src => src.Request.Description))
                .ForMember(re => re.BookDateTime, act => act.MapFrom(src => src.Request.BookDateTime))
                .ForMember(re => re.EndDate, act => act.MapFrom(src => src.Request.EndDate))
                .ForMember(re => re.EndDate, act => act.MapFrom(src => src.TotalPrice))
                .ForMember(re => re.EndDate, act => act.MapFrom(src => src.Status));

            CreateMap<Building, ResponseOfBuilding>()
                .ForMember(re => re.BuildingId, act => act.MapFrom(src => src.BuildingId))
                .ForMember(re => re.Code, act => act.MapFrom(src => src.Code))
                .ForMember(re => re.BuildingName, act => act.MapFrom(src => src.Name))
                .ForMember(re => re.BuildingAddress, act => act.MapFrom(src => src.Address))
                .ForMember(re => re.BuildingStatus, act => act.MapFrom(src => src.Status));

            CreateMap<Contract, ResponseOfContract>()
                .ForMember(re => re.ContractId, act => act.MapFrom(src => src.ContractId))
                .ForMember(re => re.ApartmentId, act => act.MapFrom(src => src.ApartmentId))
                .ForMember(re => re.ContractDetailId, act => act.MapFrom(src => src.ContractDetailId))
                .ForMember(re => re.FromDate, act => act.MapFrom(src => src.FromDate))
                .ForMember(re => re.ToDate, act => act.MapFrom(src => src.ToDate))
                .ForMember(re => re.ContractImage, act => act.MapFrom(src => src.ContractImage))
                .ForMember(re => re.ContractStatus, act => act.MapFrom(src => src.ContractStatus));

            CreateMap<ContractDetail, ResponseOfContractDetail>()
                .ForMember(re => re.ContractDetailId, act => act.MapFrom(src => src.ContractDetailId))
                .ForMember(re => re.Code, act => act.MapFrom(src => src.Code))
                .ForMember(re => re.StartDate, act => act.MapFrom(src => src.StartDate))
                .ForMember(re => re.EndDate, act => act.MapFrom(src => src.EndDate));

            CreateMap<Owner, ResponseOfOwner>()
                .ForMember(re => re.OwnerId, act => act.MapFrom(src => src.OwnerId))
                .ForMember(re => re.Code, act => act.MapFrom(src => src.OwnerId))
                .ForMember(re => re.OwnerName, act => act.MapFrom(src => src.Name))
                .ForMember(re => re.OwnerEmail, act => act.MapFrom(src => src.Email))
                .ForMember(re => re.Password, act => act.MapFrom(src => src.Password))
                .ForMember(re => re.OwnerPhone, act => act.MapFrom(src => src.Phone))
                .ForMember(re => re.OwnerAddress, act => act.MapFrom(src => src.Address))
                .ForMember(re => re.OwnerStatus, act => act.MapFrom(src => src.Status));

            CreateMap<Package, ResponseOfPackage>()
                .ForMember(re => re.PackageId, act => act.MapFrom(src => src.PackageId))
                .ForMember(re => re.ApartmentTypeId, act => act.MapFrom(src => src.ApartmentType.ApartmentTypeId))
                .ForMember(re => re.ApartmentTypeName, act => act.MapFrom(src => src.ApartmentType.Name))
                .ForMember(re => re.Code, act => act.MapFrom(src => src.Code))
                .ForMember(re => re.PackageName, act => act.MapFrom(src => src.Name))
                .ForMember(re => re.PackageDescription, act => act.MapFrom(src => src.Description))
                .ForMember(re => re.PackagePrice, act => act.MapFrom(src => src.Price));

            CreateMap<PackageServiceDetail, ResponseOfPackageServiceDetail>()
                .ForMember(re => re.PackServiceDetailId, act => act.MapFrom(src => src.PackSerDetailId))
                .ForMember(re => re.PackageId, act => act.MapFrom(src => src.PackageId))
                .ForMember(re => re.PackageName, act => act.MapFrom(src => src.Package.Name))
                .ForMember(re => re.PackagePrice, act => act.MapFrom(src => src.Package.Price))
                .ForMember(re => re.ServiceId, act => act.MapFrom(src => src.ServiceId))
                .ForMember(re => re.ServiceName, act => act.MapFrom(src => src.Service.Name))
                .ForMember(re => re.ServicePrice, act => act.MapFrom(src => src.Service.Price));

            CreateMap<Request, ResponseOfRequest>()
                .ForMember(re => re.RequestId, act => act.MapFrom(src => src.RequestId))
                .ForMember(re => re.ApartmentId, act => act.MapFrom(src => src.ApartmentId))
                .ForMember(re => re.RequestDescription, act => act.MapFrom(src => src.Description))
                .ForMember(re => re.BookDateTime, act => act.MapFrom(src => src.BookDateTime))
                .ForMember(re => re.EndDate, act => act.MapFrom(src => src.EndDate))
                .ForMember(re => re.IsSequence, act => act.MapFrom(src => src.IsSequence))
                .ForMember(re => re.RequestSequence, act => act.MapFrom(src => src.Sequence))
                .ForMember(re => re.ReqStatus, act => act.MapFrom(src => src.ReqStatus));

            CreateMap<RequestDetail, ResponseOfRequestDetail>()
                .ForMember(re => re.RequestDetailId, act => act.MapFrom(src => src.RequestDetailId))
                .ForMember(re => re.RequestId, act => act.MapFrom(src => src.RequestId))
                .ForMember(re => re.RequestDescription, act => act.MapFrom(src => src.Request.Description))
                .ForMember(re => re.BookDateTime, act => act.MapFrom(src => src.Request.BookDateTime))
                .ForMember(re => re.EndDate, act => act.MapFrom(src => src.Request.EndDate))
                .ForMember(re => re.PackageId, act => act.MapFrom(src => src.PackageId))
                .ForMember(re => re.PackageName, act => act.MapFrom(src => src.Package.Name))
                .ForMember(re => re.RequestDetailAmount, act => act.MapFrom(src => src.Amount))
                .ForMember(re => re.RequestPrice, act => act.MapFrom(src => src.Price));

            CreateMap<RequestLog, ResponseOfRequestLog>()
                .ForMember(re => re.RequestLogId, act => act.MapFrom(src => src.RequestLogId))
                .ForMember(re => re.RequestId, act => act.MapFrom(src => src.RequestId))
                .ForMember(re => re.MaintainItem, act => act.MapFrom(src => src.MaintainItem))
                .ForMember(re => re.ReqLogDescription, act => act.MapFrom(src => src.Description))
                .ForMember(re => re.RqLogStatus, act => act.MapFrom(src => src.Status));

            //CreateMap<Service, ResponseOfService>()
            //    .ForMember(re => re.ServiceId, act => act.MapFrom(src => src.ServiceId))
            //    .ForMember(re => re.Code, act => act.MapFrom(src => src.Code))
            //    .ForMember(re => re.ServiceName, act => act.MapFrom(src => src.Name))
            //    .ForMember(re => re.ServicePrice, act => act.MapFrom(src => src.Price))
            //    .ForMember(re => re.Unit, act => act.MapFrom(src => src.Unit))
            //    .ForMember(re => re.ServiceStatus, act => act.MapFrom(src => src.ServiceStatus));

            CreateMap<Staff, ResponseAccountStaff>()
                .ForMember(re => re.StaffId, act => act.MapFrom(src => src.StaffId))
                .ForMember(re => re.Email, act => act.MapFrom(src => src.Email))
                .ForMember(re => re.Name, act => act.MapFrom(src => src.Phone))
                .ForMember(re => re.Address, act => act.MapFrom(src => src.Address))
                .ForMember(re => re.StaffStatus, act => act.MapFrom(src => src.StaffStatus))
                .ForMember(re => re.AvatarLink, act => act.MapFrom(src => src.AvatarLink))
                .ForMember(re => re.Code, act => act.MapFrom(src => src.Code))
                .ForMember(re => re.Role, act => act.MapFrom(src => src.Role))
                .ForMember(re => re.StaffLogId, act => act.Ignore())
                .ForMember(re => re.StaffDetailId, act => act.Ignore());

            CreateMap<StaffDetail, ResponseOfStaffDetail>()
                .ForMember(re => re.StaffDetailId, act => act.MapFrom(src => src.StaffDetailId))
                .ForMember(re => re.StaffId, act => act.MapFrom(src => src.StaffId))
                .ForMember(re => re.StaffName, act => act.MapFrom(src => src.Staff.Name))
                .ForMember(re => re.StaffEmail, act => act.MapFrom(src => src.Staff.Email))
                .ForMember(re => re.StaffPhone, act => act.MapFrom(src => src.Staff.Phone))
                .ForMember(re => re.StaffAddress, act => act.MapFrom(src => src.Staff.Address))
                .ForMember(re => re.AvatarLink, act => act.MapFrom(src => src.Staff.AvatarLink))
                .ForMember(re => re.ServiceId, act => act.MapFrom(src => src.ServiceId))
                .ForMember(re => re.ServiceName, act => act.MapFrom(src => src.Service.Name))
                .ForMember(re => re.ServiceStatus, act => act.MapFrom(src => src.Service.ServiceStatus));

            CreateMap<StaffLog, ResponseOfStaffLog>()
                .ForMember(re => re.StaffLogId, act => act.MapFrom(src => src.StaffLogId))
                .ForMember(re => re.StaffId, act => act.MapFrom(src => src.StaffId))
                .ForMember(re => re.StaffName, act => act.MapFrom(src => src.Staff.Name))
                .ForMember(re => re.StaffStatus, act => act.MapFrom(src => src.Staff.StaffStatus))
                .ForMember(re => re.StaffRole, act => act.MapFrom(src => src.Staff.Role))
                .ForMember(re => re.RequestLogId, act => act.MapFrom(src => src.RequestLogId))
                .ForMember(re => re.ReqLogStatus, act => act.MapFrom(src => src.RequestLog.Status));

            CreateMap<Tennant, ResponseOfTennant>()
                .ForMember(re => re.TennantId, act => act.MapFrom(src => src.TennantId))
                .ForMember(re => re.TennantCode, act => act.MapFrom(src => src.Code))
                .ForMember(re => re.TennantName, act => act.MapFrom(src => src.Name))
                .ForMember(re => re.TennantEmail, act => act.MapFrom(src => src.Email))
                .ForMember(re => re.Password, act => act.MapFrom(src => src.Password))
                .ForMember(re => re.TennantPhone, act => act.MapFrom(src => src.Phone))
                .ForMember(re => re.TennantAddress, act => act.MapFrom(src => src.Address))
                .ForMember(re => re.TennantStatus, act => act.MapFrom(src => src.Status))
                .ForMember(re => re.ContractDetailId, act => act.MapFrom(src => src.ContractDetailId))
                .ForMember(re => re.StartDate, act => act.MapFrom(src => src.ContractDetail.StartDate))
                .ForMember(re => re.EndDate, act => act.MapFrom(src => src.ContractDetail.EndDate));
        }
    }
}
