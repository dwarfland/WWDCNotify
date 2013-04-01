﻿namespace WWDCNotifyServer;

interface

uses
  System.Collections,
  System.Collections.Generic,
  System.ComponentModel, 
  System.Linq,
  System.Net,
  System.Reflection.Emit,
  RemObjects.SDK.ApplePushProvider,
  RemObjects.SDK.Server;

type
  /// <summary>
  /// Summary description for Scheduler.
  /// </summary>
  IPhoneNotifier = public static partial class
  private
    fTimer: System.Timers.Timer := nil;
    fInTimer: Boolean;
    
    fLastWebsite: String;
    fLifesignCounter: Int32;
    const PING_TIME = 5*60*1000; // 5 mins
    const LIFESIGN_MAX = 12*2;   // every 2 hours, at 5mins intervals
    const URL = 'https://developer.apple.com/wwdc/';

    method TimerElapsed(sender: Object; e: System.Timers.ElapsedEventArgs);
  protected
  public
    constructor;

    method Start;
    method Stop;
  end;

implementation

{$REGION Construction and Disposition}
constructor IPhoneNotifier;
begin
  fTimer := new System.Timers.Timer;
  fTimer.Interval := PING_TIME;
  fTimer.Elapsed += TimerElapsed;
end;
{$ENDREGION}

method IPhoneNotifier.TimerElapsed(sender: Object; e: System.Timers.ElapsedEventArgs);
begin
  if fInTimer then exit;
  fInTimer := true;
  try

    inc(fLifesignCounter);

    writeLn('checking '+URL);
    var lNewWebsite: String;
    using lCient: WebClient := new WebClient() do 
      lNewWebsite := lCient.DownloadString(URL);

    if {assigned(fLastWebsite) and} (fLastWebsite ≠ lNewWebsite) then begin
      
      writeLn('sending alarm');
      for each d in PushDeviceManager.Devices.Values do
        PushDeviceManager.APSConnect.PushCombinedNotification(d.Token.ToArray, 'ALARM ALARM! The WWDC Website has changed', 0, 'default');
      writeLn('sending alarm, done');

    end
    else begin
      if fLifesignCounter > LIFESIGN_MAX then begin
        fLifesignCounter := 0;
        writeLn('sending lifesign');
        for each d in PushDeviceManager.Devices.Values do
          PushDeviceManager.APSConnect.PushMessageNotification(d.Token.ToArray, "False alarm. Just assuring you we're still alive and kicking");
        writeLn('sending lifesign, done');
      end;
    end;
    fLastWebsite := lNewWebsite;

  except
    on Ex:Exception do begin
      writeLn(Ex.GetType.Name+': '+Ex.Message);
    end;
  finally
    fInTimer := false;
  end;
end;

method IPhoneNotifier.Start;
begin
  for each d in PushDeviceManager.Devices.Values do
    PushDeviceManager.APSConnect.PushMessageNotification(d.Token.ToArray, 'False alarm. WWDCNotify Server was just restarted');
  fTimer.Enabled := true;
  TimerElapsed(nil, nil);
end;

method IPhoneNotifier.Stop;
begin
  fTimer.Enabled := false;
end;

end.
