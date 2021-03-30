#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <objc/runtime.h>
#import <SpringBoard/SpringBoard.h>
#import "MediaRemote.h"
BOOL blurEnabled;
NSString *draggerColor;
NSString *circlecolor;
NSString *openAppBundleid;
double circleSize;
double leftshortcut;
double rightshortcut;
#define OpenAppFromJelly @"com.megadev.jellylockreborn/OpenAppFromJelly"
#define hideCSQuickactionsFromJelly @"com.megadev.jellylockreborn/hideCSQuickactionsFromJelly"
#define showCSQuickactionsFromJelly @"com.megadev.jellylockreborn/showCSQuickactionsFromJelly"
#define StartSentinel @"com.megadev.sentinel/StartSentinel"
@interface UIImage (Private)
+(UIImage *)_applicationIconImageForBundleIdentifier:(NSString *)bundleIdentifier format:(int)format scale:(CGFloat)scale;
@end




@interface MTMaterialView : UIView

+(id)materialViewWithRecipe:(long long)arg1 configuration:(long long)arg2 initialWeighting:(double)arg3 ;
-(void)_setCornerRadius:(double)arg1 ;
-(void)_setContinuousCornerRadius:(double)arg1 ;

@end

@interface SBLockScreenController : NSObject
+ (id)sharedInstance;
- (BOOL)_finishUIUnlockFromSource:(int)arg1 withOptions:(id)arg2;
@end
@interface SBLockScreenManager : NSObject

+(id)sharedInstance;
 -(_Bool)unlockUIFromSource:(int)arg1 withOptions:(id)arg2;
-(BOOL)isUILocked;
@end


@interface UIApplication (openlistener)
+(id)sharedApplication;
-(BOOL)launchApplicationWithIdentifier:(id)arg1 suspended:(BOOL)arg2;
@end



@interface JellylockView : UIView
@property  (nonatomic, strong) UIColor *circleColor;



@property  (nonatomic, strong) NSString *app1;
@property  (nonatomic, strong) NSString *app2;
@property  (nonatomic, strong) NSString *app3;
@property  (nonatomic, strong) NSString *app4;
@property  (nonatomic, strong) NSString *app5;
 -(void)resetJelly;
 -(void)loadIcons;
@property (nonatomic,retain) UIView *Usercircle;
@property (nonatomic,retain) UIView *jellyBackDrop;
@property (nonatomic,retain) UIView *jellycontainer;
@property (nonatomic,retain) UIView *bigCircle;
@property (nonatomic,retain) UIView *returnJelly;

@property (nonatomic,retain) UIView *blurView;

@property (nonatomic,retain) UIView *jellyApp1;
@property (nonatomic,retain) UIView *jellyApp2;
@property (nonatomic,retain) UIView *jellyApp3;
@property (nonatomic,retain) UIView *jellyApp4;
@property (nonatomic,retain) UIView *jellyApp5;
@property (nonatomic,retain) UIView *jellyApp6;
@property (nonatomic,retain) UIView *jellyApp7;

@property (nonatomic,retain) UIPanGestureRecognizer *MoveCircleGesture;
@end


@interface SBUIFlashlightController : NSObject

+ (id)sharedInstance;
-(void)setLevel:(unsigned long long)arg1 ;
- (NSInteger)level;

@end

@interface SBDashBoardMesaUnlockBehaviorConfiguration : NSObject
- (BOOL)_isAccessibilityRestingUnlockPreferenceEnabled;
@end

@interface SBDashBoardBiometricUnlockController : NSObject
@end

