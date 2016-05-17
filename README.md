MvvX.Autofac.Extras
========================

This project is a fork of the original project : https://github.com/autofac/Autofac.Extras.MvvmCross

## Compatibility
This project already works only for a WPF app. The nuspec file will be updated quickly.

###How to use it ?
#### Add package from nuGet
nuget package url : https://www.nuget.org/packages/MvvX.Autofac.Extras/
 
- Add the package on your UI project (WPF).
- Add the package on your project that embed the App class (inherits from MvxApplication)

#### Setup class :
Override the  CreateIocProvider() method, and add a new container :

	private IContainer container;

    protected override IMvxIoCProvider CreateIocProvider()
    {
        container = new ContainerBuilder().Build();
        return new MvvX.Autofac.Extras.AutofacMvxIocProvider(container);
    }

End !

All registered class or interface will use Autofac !
