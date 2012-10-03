//
//  ViewController.m
//  UiSearchBar
//
//  Created by apple on 10/2/12.
//  Copyright (c) 2012 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    allItems = [[NSArray alloc] initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five",@"Six",@"Sevent",@"Eeight",@"Nine",@"Ten",@"Eleven",@"Twelve", nil];
    displayItems = [[NSMutableArray alloc] initWithArray:allItems];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardShown:(NSNotification *)note {
    CGRect keyboardFrame;
    [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
    CGRect tableViewFrame = tableView.frame;
    tableViewFrame.size.height -= keyboardFrame.size.height;
    [tableView setFrame:tableViewFrame];
}

-(void)keyboardHidden:(NSNotification *)note {
    [tableView setFrame:self.view.bounds];
}

-(NSInteger)numberOfSelectionInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [displayItems count];
}

-(UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [displayItems objectAtIndex:indexPath.row];
    return cell;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText length] == 0) {
        [displayItems removeAllObjects];
        [displayItems addObjectsFromArray:allItems];
    } else {
        [displayItems removeAllObjects];
        for (NSString *string in allItems) {
            NSRange r = [string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (r.location != NSNotFound) {
                [displayItems addObject:string];
            }
        }
    }
    [tableView reloadData];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)aSearchBar {
    [searchBar resignFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
