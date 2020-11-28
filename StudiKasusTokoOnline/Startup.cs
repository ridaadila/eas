using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(StudiKasusTokoOnline.Startup))]
namespace StudiKasusTokoOnline
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
