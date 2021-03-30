#include "AppShortcutsListController.h"

@implementation AppShortcutsListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Apps" target:self];
	}

	return _specifiers;
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)showApp1
{
	SparkAppListTableViewController *applist1 = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.megadev.jellylockreborn" andKey:@"app1"];
	[self.navigationController pushViewController:applist1 animated:YES];
    applist1.maxEnabled=1;
	self.navigationItem.hidesBackButton = FALSE;
}

-(void)showApp2
{
	SparkAppListTableViewController *applist2 = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.megadev.jellylockreborn" andKey:@"app2"];
	[self.navigationController pushViewController:applist2 animated:YES];
    applist2.maxEnabled=1;
	self.navigationItem.hidesBackButton = FALSE;
}


-(void)showApp3
{
	SparkAppListTableViewController *applist3 = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.megadev.jellylockreborn" andKey:@"app3"];
	[self.navigationController pushViewController:applist3 animated:YES];
    applist3.maxEnabled=1;
	self.navigationItem.hidesBackButton = FALSE;
}


-(void)showApp4
{
	SparkAppListTableViewController *applist4 = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.megadev.jellylockreborn" andKey:@"app4"];
	[self.navigationController pushViewController:applist4 animated:YES];
    applist4.maxEnabled=1;
	self.navigationItem.hidesBackButton = FALSE;
}


-(void)showApp5
{
	SparkAppListTableViewController *applist5 = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.megadev.jellylockreborn" andKey:@"app5"];
	[self.navigationController pushViewController:applist5 animated:YES];
    applist5.maxEnabled=1;
	self.navigationItem.hidesBackButton = FALSE;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}
@end
