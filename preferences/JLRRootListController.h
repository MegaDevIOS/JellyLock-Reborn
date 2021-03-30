#import <Preferences/PSListController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import <spawn.h>
#import <MessageUI/MessageUI.h>

@interface JLRRootListController : HBRootListController <MFMailComposeViewControllerDelegate> { 
    UITableView * _table;
}
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *headerImageView;
@end
