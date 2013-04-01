namespace WWDCNotifyServer;

interface

uses
  System,
  System.IO,
  RemObjects.SDK,
  RemObjects.SDK.ApplePushProvider,
  RemObjects.SDK.Server;

type
  WWDCNotifyServerMain = class
  public
    class method Main;
  end;

implementation

class method WWDCNotifyServerMain.Main;
var
  lServerChannel: IpHttpServerChannel;
  lMessage: Message;
begin
  Console.WriteLine('WWDC Notify Command Line Server');

  var lCertificatePath := Path.ChangeExtension(typeOf(self).Assembly.Location, 'p12');
  PushDeviceManager.DeviceStoreFile :=  Path.ChangeExtension(typeOf(self).Assembly.Location, 'devices');
  PushDeviceManager.CertificateFile := lCertificatePath;
  PushDeviceManager.APSConnect.ApsHost := 'gateway.sandbox.push.apple.com'; // for this app, we're staying in the sandbox
  PushDeviceManager.RequireSession := false;
  writeLn('Loaded Certificate from '+lCertificatePath);

  IPhoneNotifier.Start();

  lServerChannel := new RemObjects.SDK.Server.IpHttpServerChannel();
  lServerChannel.Port := 8097;
  lMessage := new RemObjects.SDK.BinMessage();

  lServerChannel.Dispatchers.Add(lMessage.DefaultDispatcherName, lMessage);
        
  lServerChannel.Open();
  try
    Console.WriteLine('Server is active, press Enter to stop.');
    Console.ReadLine();
  finally
    lServerChannel.Close();
  end;
end;

end.
