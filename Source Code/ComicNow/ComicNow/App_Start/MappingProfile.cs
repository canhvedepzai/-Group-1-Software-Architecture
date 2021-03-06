﻿using AutoMapper;
using ComicNow.DTOs;
using ComicNow.DTOs.Account;
using ComicNow.DTOs.Chapter;
using ComicNow.DTOs.Comic;
using ComicNow.DTOs.Comment;
using ComicNow.DTOs.Page;
using ComicNow.DTOs.Rating;
using ComicNow.Models;

namespace ComicNow
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            Mapper.CreateMap<Account, LoginAccountDto>().ReverseMap();

            Mapper.CreateMap<Account, AccountDto>().ReverseMap();

            Mapper.CreateMap<Account, AccountDtoForAdmin>().ReverseMap();

            Mapper.CreateMap<Chapter, ChapterDto>().ReverseMap();

            Mapper.CreateMap<Publisher, PublisherDto>().ReverseMap();

            Mapper.CreateMap<Author, AuthorDto>().ReverseMap();

            Mapper.CreateMap<Tag, TagDto>().ReverseMap();

            Mapper.CreateMap<Comic, ComicDto>().ReverseMap();

            Mapper.CreateMap<Comic, LightWeightComicDto>();

            Mapper.CreateMap<Comic, ComicThumbnailDto>().ReverseMap();

            Mapper.CreateMap<Comment, CommentDto>().ReverseMap();

            Mapper.CreateMap<Comment, PostCommentDto>().ReverseMap();

            Mapper.CreateMap<Chapter, ChapterDto>().ReverseMap();

            Mapper.CreateMap<Page, PageDto>().ReverseMap();

            Mapper.CreateMap<Role, RoleDto>().ReverseMap();

            Mapper.CreateMap<RatingList, RatingDto>();


        }

        
    }
}