﻿using System.Web.Http.Filters;

namespace ComicNow
{
    using System;
    using System.Web.Http.Filters;

    public class AllowCrossSiteJsonAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            //if (actionExecutedContext.Response != null)
            //{
            //    actionExecutedContext.Response.Headers.Add("Access-Control-Allow-Origin", "*");
            //    actionExecutedContext.Response.Headers.Add("Access-Control-Allow-Headers", "*");
            //    actionExecutedContext.Response.Headers.Add("Access-Control-Allow-Credentials", "true");
            //}
            base.OnActionExecuted(actionExecutedContext);
        }
    }
}