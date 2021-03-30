#include "AppearanceListController.h"

@implementation AppearanceListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Appearance" target:self];
	}

	return _specifiers;
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}
@end
