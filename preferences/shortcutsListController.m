#include "shortcutsListController.h"

@implementation shortcutsListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Shortcuts" target:self];
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
