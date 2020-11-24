using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DoanWebQLMYPHAM.Startup))]
namespace DoanWebQLMYPHAM
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
