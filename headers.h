

#import "VIEWS/jellylock.h"

#import "SparkAppList.h"
#import <Cephei/HBPreferences.h>

#define OpenAppFromJelly @"com.megadev.jellylockreborn/OpenAppFromJelly"
#define hideCSQuickactionsFromJelly @"com.megadev.jellylockreborn/hideCSQuickactionsFromJelly"

@interface CSCoverSheetViewController : UIViewController

@property (nonatomic,retain) JellylockView *JellyLock;

@end

@interface UIApplication (openlistener)
+(id)sharedApplication;
-(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end




@interface SBSleepWakeHardwareButtonInteraction
-(void)_performSleep;
-(void)_performWake;

@end

@interface SBTapToWakeController
-(void)setScreenOff:(BOOL)arg1 ;
-(BOOL)shouldTapToWake;
-(void)tapToWakeDidRecognize:(id)arg1;
@end

@interface SBLiftToWakeController
-(void)removeObserver:(id)arg1;
+(id)sharedController;
-(void)_screenTurnedOff;
-(void)_stopObservingIfNecessary;
@end


@interface CSTeachableMomentsContainerView { }
@property (nonatomic,retain) UIView * controlCenterGrabberView;
@property (nonatomic,retain) UIView * callToActionLabel;
@end

@interface CSQuickActionsView : UIView

@end

@interface CSQuickActionsViewController : UIViewController
@end
