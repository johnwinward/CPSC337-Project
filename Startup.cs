using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CPSC337_Project.Startup))]
namespace CPSC337_Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
