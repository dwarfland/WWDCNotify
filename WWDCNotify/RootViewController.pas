namespace WWDCNotify;

interface

uses
  UIKit;

type
  [IBObject]
  RootViewController = public class(UIViewController)
  private
  public
    method init: id; override;

    method viewDidLoad; override;
    method didReceiveMemoryWarning; override;

  end;

implementation

method RootViewController.init: id;
begin
  self := inherited initWithNibName('RootViewController') bundle(nil);
  if assigned(self) then begin

    title := 'WWDCNotify';

    // Custom initialization

  end;
  result := self;
end;

method RootViewController.viewDidLoad;
begin
  inherited viewDidLoad;

  // Do any additional setup after loading the view.
end;

method RootViewController.didReceiveMemoryWarning;
begin
  inherited didReceiveMemoryWarning;

  // Dispose of any resources that can be recreated.
end;

end.
