﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using SGCorpHR.BLL;
using SGCorpHR.Models;

namespace SGCorpHR.UI.Controllers
{
    public class EmployeeDirectoryController : ApiController
    {
        public List<Employee> Get()
        {
            var ops = new EmployeeDirectoryOperations();
            var response = ops.ListAllEmployees();
            var list = response.Data;
            return list;
        }

        public List<Employee> Get(int id)
        {
            var ops = new EmployeeDirectoryOperations();
            var response = ops.GetEmpByDptID(id);
            var list = response.Data;
            
            return list;
        }

        public void Delete(int id)
        {
            var ops = new EmployeeDirectoryOperations();
            ops.DeleteEmpById(id);
        }

        public void Put(Employee employee)
        {
            var ops = new EmployeeDirectoryOperations();
            ops.UpdateEmployee(employee);
        }
    }
}
