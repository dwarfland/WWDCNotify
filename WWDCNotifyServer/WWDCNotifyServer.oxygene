<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <RootNamespace>WWDCNotifyServer</RootNamespace>
    <OutputType>exe</OutputType>
    <AssemblyName>WWDCNotifyServer</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyWith>False</AllowLegacyWith>
    <AllowLegacyCode>False</AllowLegacyCode>
    <AllowLegacyOutParams>True</AllowLegacyOutParams>
    <AllowUnsafeCode>False</AllowUnsafeCode>
    <ApplicationIcon>Properties\App.ico</ApplicationIcon>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
    <Name>WWDCNotifyServer</Name>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <OutputPath>.\bin\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <EnableAsserts>True</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>.\bin\Release</OutputPath>
    <GeneratePDB>False</GeneratePDB>
    <GenerateMDB>False</GenerateMDB>
    <EnableAsserts>False</EnableAsserts>
    <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
    <CaptureConsoleOutput>False</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <RegisterForComInterop>False</RegisterForComInterop>
    <CpuType>anycpu</CpuType>
    <RuntimeVersion>v25</RuntimeVersion>
    <XmlDoc>False</XmlDoc>
    <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib">
      <Name>mscorlib</Name>
    </Reference>
    <Reference Include="System">
      <Name>System</Name>
    </Reference>
    <Reference Include="RemObjects.SDK.ZLib">
      <HintPath>C:\Program Files (x86)\RemObjects Software\RemObjects SDK for .NET\Bin\RemObjects.SDK.ZLib.dll</HintPath>
      <Name>RemObjects.SDK.ZLib.dll</Name>
      <Private>True</Private>
    </Reference>
    <Reference Include="RemObjects.InternetPack">
      <HintPath>C:\Program Files (x86)\RemObjects Software\RemObjects SDK for .NET\Bin\RemObjects.InternetPack.dll</HintPath>
      <Name>RemObjects.InternetPack.dll</Name>
      <Private>True</Private>
    </Reference>
    <Reference Include="RemObjects.SDK">
      <HintPath>C:\Program Files (x86)\RemObjects Software\RemObjects SDK for .NET\Bin\RemObjects.SDK.dll</HintPath>
      <Name>RemObjects.SDK.dll</Name>
      <Private>True</Private>
    </Reference>
    <Reference Include="RemObjects.SDK.Server">
      <HintPath>C:\Program Files (x86)\RemObjects Software\RemObjects SDK for .NET\Bin\RemObjects.SDK.Server.dll</HintPath>
      <Name>RemObjects.SDK.Server.dll</Name>
      <Private>True</Private>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="IPhoneNotifier.pas" />
    <Compile Include="Main.pas" />
    <Content Include="WWDCNotifyServer.p12">
      <SubType>Content</SubType>
      <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
    <Rodl Include="WWDCNotifyServer.RODL" />
    <Compile Include="Properties\AssemblyInfo.pas" />
    <EmbeddedResource Include="Properties\licenses.licx" />
    <Content Include="Properties\App.ico" />
    <None Include="Getting Started.html">
      <ExcludeFromBuild>Yes</ExcludeFromBuild>
    </None>
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\..\RemObjects.SDK.ApplePushProvider\RemObjects.SDK.ApplePushProvider.oxygene">
      <Name>RemObjects.SDK.ApplePushProvider</Name>
      <Project>{6ee56252-1979-48fa-8409-3dced05426c3}</Project>
      <Private>True</Private>
      <HintPath>..\..\RemObjects.SDK.ApplePushProvider\bin\Debug\RemObjects.SDK.ApplePushProvider.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\RemObjects SDK\RemObjects.SDK.targets" />
  <PropertyGroup>
    <PreBuildEvent />
  </PropertyGroup>
</Project>