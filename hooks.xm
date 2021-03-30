#import "headers.h"
HBPreferences *pfs;
BOOL hideQuickactions;



%hook CSCoverSheetViewController

%property (nonatomic,retain) JellylockView *JellyLock;





-(void)viewDidLoad{

	    %orig;

	
/* Setup View */
    self.JellyLock = [[JellylockView alloc] init];
    self.JellyLock.translatesAutoresizingMaskIntoConstraints = NO;
    self.JellyLock.backgroundColor = [UIColor clearColor];
/* Load apps */
	NSArray *appsarray = [SparkAppList getAppListForIdentifier:@"com.megadev.jellylockreborn" andKey:@"app1"];
  appsarray = [appsarray arrayByAddingObjectsFromArray:[SparkAppList getAppListForIdentifier:@"com.megadev.jellylockreborn" andKey:@"app2"]];
	appsarray = [appsarray arrayByAddingObjectsFromArray:[SparkAppList getAppListForIdentifier:@"com.megadev.jellylockreborn" andKey:@"app3"]];
	appsarray = [appsarray arrayByAddingObjectsFromArray:[SparkAppList getAppListForIdentifier:@"com.megadev.jellylockreborn" andKey:@"app4"]];
	appsarray = [appsarray arrayByAddingObjectsFromArray:[SparkAppList getAppListForIdentifier:@"com.megadev.jellylockreborn" andKey:@"app5"]];
	 NSLog(@"NUTS %@",appsarray);

	

	/* Insert apps in view */
	for (int i = 0; i < [appsarray count]; i++) {
 

		switch(i){
         case 0  :
           self.JellyLock.app1 = [appsarray objectAtIndex:0];
         break;
         case 1  :
           self.JellyLock.app2 = [appsarray objectAtIndex:1];
         break;
		 case 2  :
           self.JellyLock.app3 = [appsarray objectAtIndex:2];
         break;
		 case 3  :
           self.JellyLock.app4 = [appsarray objectAtIndex:3];
         break;
		 case 4  :
           self.JellyLock.app5 = [appsarray objectAtIndex:4];
         break;

  

         

}
	
     }






/* Position view */

  [self.view addSubview:self.JellyLock];
	[self.JellyLock loadIcons];
    
    [NSLayoutConstraint activateConstraints:@[
              [self.JellyLock.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:15],
              [self.JellyLock.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor],
              [self.JellyLock.widthAnchor constraintEqualToConstant:self.view.frame.size.width],
              [self.JellyLock.heightAnchor constraintEqualToConstant:250],
    ]];

	
    


      
		self.view.clipsToBounds = YES;





	     [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(resetJelly:)
                                                 name:@"resetJelly"
                                               object:nil];
	
}


/* Fallbacks */

-(void)viewWillAppear:(BOOL)arg1{

	%orig;

	[self.JellyLock resetJelly];
}

-(void)viewDidAppear:(BOOL)arg1 {
	%orig;
	[self.JellyLock resetJelly];
}
%new
-(void)resetJelly:(id)arg1{
	[self.JellyLock resetJelly];
}

%end




/* This shit was in the way and honestly nobody cares for this label */

%hook CSTeachableMomentsContainerView
-(void)layoutSubviews{

		self.callToActionLabel.hidden = YES;


	 return %orig;
}

%end



%hook SBSleepWakeHardwareButtonInteraction

-(void)_performWake {
     %orig;

	[[NSNotificationCenter defaultCenter] postNotificationName:@"resetJelly"  object:self];
}

%end

%hook SBTapToWakeController

-(void)tapToWakeDidRecognize:(id)arg1{
     %orig;
  
	[[NSNotificationCenter defaultCenter] postNotificationName:@"resetJelly"  object:self];
}

%end

%hook CSQuickActionsViewController
-(void)loadView{
  %orig;

  if(hideQuickactions){
	  self.view.hidden = YES;

  }else{
		     [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideQuickAction:)
                                                 name:@"hideQuickAction"
                                               object:nil];
											   		     [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showQuickAction:)
                                                 name:@"showQuickAction"
                                               object:nil];
  }


											   
}

%new
-(void)hideQuickAction:(id)arg1{
     self.view.hidden = YES;
}

%new
-(void)showQuickAction:(id)arg1{
     self.view.hidden = NO;
}
%end

%hook SBDashBoardBiometricUnlockController
- (void)setAuthenticated:(BOOL)authenticated {

    %orig;

    if(authenticated && openAppBundleid != nil) {


      /* Not so very clean solution to opening after unlock but i couldnt find a better solution */

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
			[[UIApplication sharedApplication] launchApplicationWithIdentifier:openAppBundleid suspended:FALSE];
			openAppBundleid = nil;

         });


        }


        }
   %end



void openApp() {

[[objc_getClass("SBLockScreenManager") sharedInstance] unlockUIFromSource:17 withOptions:nil];
}

void hideCSQuickactions(){
	[[NSNotificationCenter defaultCenter] postNotificationName:@"hideQuickAction"  object:nil];
}

void showCSQuickactions(){
	[[NSNotificationCenter defaultCenter] postNotificationName:@"showQuickAction"  object:nil];
}

%ctor{


pfs = [[HBPreferences alloc] initWithIdentifier:@"com.megadev.jellylockreborn"];



[pfs registerBool:&blurEnabled default:YES forKey:@"blurEnabled"];
[pfs registerBool:&hideQuickactions default:NO forKey:@"hideQuickactions"];
[pfs registerDouble:&circleSize default:70 forKey:@"circleSize"];
[pfs registerObject:&draggerColor default:@"#fffffff" forKey:@"draggerColor"];
[pfs registerObject:&circlecolor default:@"#fffffff" forKey:@"bigCircleColor"];
[pfs registerDouble:&leftshortcut default:1 forKey:@"leftshortcut"];
[pfs registerDouble:&rightshortcut default:2 forKey:@"rightshortcut"];

        










CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
NULL,
(CFNotificationCallback)openApp,
(CFStringRef)OpenAppFromJelly,
NULL,
(CFNotificationSuspensionBehavior) kNilOptions);


CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
NULL,
(CFNotificationCallback)hideCSQuickactions,
(CFStringRef)hideCSQuickactionsFromJelly,
NULL,
(CFNotificationSuspensionBehavior) kNilOptions);

CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
NULL,
(CFNotificationCallback)showCSQuickactions,
(CFStringRef)showCSQuickactionsFromJelly,
NULL,
(CFNotificationSuspensionBehavior) kNilOptions);
}



