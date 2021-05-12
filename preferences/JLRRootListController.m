#include "JLRRootListController.h"

@implementation JLRRootListController 

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/jellylockrebornpref.bundle/JLRBanner.png"];
    self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.headerImageView.clipsToBounds = YES;

    [self.headerView addSubview:self.headerImageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
        [self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
        [self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
        [self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

    _table.tableHeaderView = self.headerImageView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.tableHeaderView = self.headerView;
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}


-(void)hb_sendSupportEmail{
	MFMailComposeViewController *mcvc = [[MFMailComposeViewController alloc] init];
    mcvc.mailComposeDelegate = self;
    NSString *toAddress = @"megadeviOS@protonmail.com";

    [mcvc setToRecipients:[NSArray arrayWithObjects:toAddress,nil]];
    [mcvc setSubject:[NSString stringWithFormat:@"JellyLock Reborn Support %@", [[UIDevice currentDevice] systemVersion]]];
    [mcvc setMessageBody:[NSString stringWithFormat:@"Issue: (.....) \n How to reproduce: (......) \n"] isHTML:NO];
	[self presentViewController:mcvc animated:YES completion:nil];


}

- (void)respring {
[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=JellyLock Reborn"]];
}

- (void)resetPrefs {
	HBPreferences *prefs =
		[[HBPreferences alloc] initWithIdentifier:@"com.megadev.jellylockreborn"];
	[prefs removeAllObjects];

[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=JellyLock Reborn"]];
}
@end
