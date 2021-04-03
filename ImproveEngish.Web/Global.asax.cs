using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Entity;
using ImproveEnglish.Business.Abstract;
using ImproveEnglish.Business.Concrete;
using ImproveEnglish.Web;
using Microsoft.AspNet.WebFormsDependencyInjection.Unity;
using Unity;

namespace ImproveEngish.Web
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            var container = this.AddUnity();
            container.RegisterType<IUniversityService, UniversityManager>();
            container.RegisterType<IDepartmentOfUniversityService, DepartmentOfUniversityManager>();
            container.RegisterType<IDepartmentService, DepartmentManager>();

            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}