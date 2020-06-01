//
//  NARArtistTableViewController.m
//  Favorite Artists
//
//  Created by Nicolas Rios on 5/31/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

#import "NARArtistTableViewController.h"
#import "NARArtists.h"
#import "NARArtistsController.h"
#import "NARArtistDetailViewController.h"



@interface NARArtistTableViewController ()

@property (nonatomic) NARArtistsController *artistController;
@property (nonatomic) NSMutableArray *savedArtist;

@end

@implementation NARArtistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tempArtists = [self.artistController fetchSavedArtists];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:tempArtists];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSArray *tempArtist = [self.artistController fetchSavedArtists];
    self.savedArtist = [[NSMutableArray alloc] initWithArray:tempArtist];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.savedArtist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];
    
    NARArtists *artist = self.savedArtist[indexPath.row];
    
    if (artist.yearFormed == 0) {
        cell.detailTextLabel.text = @"N/A";
        cell.textLabel.text = artist.artist;
    } else {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Formed in %d", artist.yearFormed];
        cell.textLabel.text = artist.artist;
    }
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddArtistsSegue"]) {
        NARArtistDetailViewController *controller = (NARArtistDetailViewController *)segue.destinationViewController;
        controller.artistController = self.artistController;
        
    }
    
    if ([segue.identifier isEqualToString:@"CellToViewControllerSegue"]) {
        NARArtistDetailViewController *controller = (NARArtistDetailViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        controller.artist = self.savedArtist[selectedIndexPath.row];
    }
}

- (NARArtistsController *)artistController {
    if (!_artistController) {
        _artistController = [[NARArtistsController alloc] init];
    }
    
    return _artistController;
}

@end



