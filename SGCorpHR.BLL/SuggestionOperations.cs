﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGCorpHR.DATA;
using SGCorpHR.Models;
using SGCorpHR.Models.Interfaces;

namespace SGCorpHR.BLL
{
    public class SuggestionOperations

    {
        private ISuggestionRepository _suggestionRepo;

        public SuggestionOperations(ISuggestionRepository myRepo)
        {
            _suggestionRepo = myRepo;
        }

        public Response<List<Suggestion>> DisplaySuggestions(string filePath)
        {
            
            var response = new Response<List<Suggestion>>();
            var suggestions = _suggestionRepo.GetAllSuggestions(filePath);
            try
            {
                if (suggestions.Count > 0)
                {
                    response.Success = true;
                    response.Data = suggestions;

                }
                else
                {
                    response.Success = false;
                    response.Message = "There are no suggestions at this time";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }
            return response;
        }

        public void DeleteSuggestions(int suggestionID, string filePath)
        {
            var repo = new SuggestionRepository();
            var response = new Response<List<Suggestion>>();
            repo.RemoveFile(suggestionID, filePath);
            try
            {
                response.Success = true;

            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
            }
            
        }

        public void AddSuggestion(Suggestion suggestion, string filePath)
        {
            var repo = new SuggestionRepository();
            repo.AddSuggestion(suggestion, filePath);
           

        }
    }
}
