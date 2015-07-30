﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using SGCorpHR.Models;
using SGCorpHR.Models.Interfaces;

namespace SGCorpHR.DATA
{
   public class EmployeeDirectoryRepository : IEmployeeDirectoryRepository
    {
        public List<Employee> ListAllEmployees()
        {
            using (SqlConnection cn = new SqlConnection(Settings.ConnectionString))
            {
                return cn.Query<Employee>("EmployeeDirectory", commandType: CommandType.StoredProcedure).ToList();
            }

        }
    }
}