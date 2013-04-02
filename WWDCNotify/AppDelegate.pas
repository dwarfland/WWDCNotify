namespace WWDCNotify;

interface

uses
  RemObjectsSDK,
  UIKit;

type
  [IBObject]
  AppDelegate = class(IUIApplicationDelegate)
  private
    const URL = 'http://McMervyn.local:8097/bin';
    //const URL := 'http://berlin.elitedev.com:8097/bin';  // log: shitty error recovery from this
  public
    property window: UIWindow;

    method application(application: UIApplication) didFinishLaunchingWithOptions(launchOptions: NSDictionary): Boolean;
    method applicationWillResignActive(application: UIApplication);
    method applicationDidEnterBackground(application: UIApplication);
    method applicationWillEnterForeground(application: UIApplication);
    method applicationDidBecomeActive(application: UIApplication);
    method applicationWillTerminate(application: UIApplication);
    method applicationDidFinishLaunching(application: UIKit.UIApplication);

    method application(application: UIKit.UIApplication) didRegisterForRemoteNotificationsWithDeviceToken(deviceToken: Foundation.NSData);
    method application(application: UIKit.UIApplication) didFailToRegisterForRemoteNotificationsWithError(error: Foundation.NSError);
    method application(application: UIKit.UIApplication) didReceiveRemoteNotification(userInfo: Foundation.NSDictionary);
  end;

implementation

method AppDelegate.application(application: UIApplication) didFinishLaunchingWithOptions(launchOptions: NSDictionary): Boolean;
begin
  window := new UIWindow withFrame(UIScreen.mainScreen.bounds);
  window.rootViewController := new RootViewController;
  window.makeKeyAndVisible;
  result := true;

  application.registerForRemoteNotificationTypes(UIRemoteNotificationType.UIRemoteNotificationTypeAlert or
                                                 UIRemoteNotificationType.UIRemoteNotificationTypeBadge or
                                                 UIRemoteNotificationType.UIRemoteNotificationTypeSound)
end;

method AppDelegate.applicationWillResignActive(application: UIApplication);
begin
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
end;

method AppDelegate.applicationDidEnterBackground(application: UIApplication);
begin
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
end;

method AppDelegate.applicationWillEnterForeground(application: UIApplication);
begin
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
end;

method AppDelegate.applicationDidBecomeActive(application: UIApplication);
begin
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
end;

method AppDelegate.applicationWillTerminate(application: UIApplication);
begin
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
end;

method AppDelegate.applicationDidFinishLaunching(application: UIKit.UIApplication);
begin

end;

method AppDelegate.application(application: UIKit.UIApplication) didRegisterForRemoteNotificationsWithDeviceToken(deviceToken: Foundation.NSData);
begin
  NSLog('Registered for push with devcie id %@', deviceToken.description);

  var p := new ApplePushProviderService_AsyncProxy withURL(new NSURL withString(URL));
  p.beginRegisterDevice(deviceToken, UIDevice.currentDevice.name) startWithBlock(method (aRequest: ROAsyncRequest) begin

      try
        p.endRegisterDevice(aRequest);
        NSLog('Registered with server');
        var lAlert := new UIAlertView withTitle('All set!') message('You are registered for Push Notitications!') &delegate(nil) cancelButtonTitle('Okay!') otherButtonTitles(nil);
        lAlert.show();
      except
        on E: NSException do begin
          // doesnt catch!? why? Nougat bug?
          var lAlert := new UIAlertView withTitle('Failed to register with server') message(E.description) &delegate(nil) cancelButtonTitle('Cancel') otherButtonTitles(nil);
          lAlert.show();
        end;
      end;

    end);
end;

method AppDelegate.application(application: UIKit.UIApplication) didFailToRegisterForRemoteNotificationsWithError(error: Foundation.NSError);
begin
  var lAlert := new UIAlertView withTitle('Failed to register for Push') message(error.localizedDescription) &delegate(nil) cancelButtonTitle('Cancel') otherButtonTitles(nil);
  lAlert.show();
end;

method AppDelegate.application(application: UIKit.UIApplication) didReceiveRemoteNotification(userInfo: Foundation.NSDictionary);
begin

end;



end.
