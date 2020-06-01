//
//  NARArtistDetailViewController.m
//  Favorite Artists
//
//  Created by Nicolas Rios on 5/31/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

#import "NARArtistDetailViewController.h"
#import "NARArtists.h"
#import "NARArtistsController.h"
#import "NARArtist+NSJSONSerialization.h"

@interface NARArtistDetailViewController ()<UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearFormed;
@property (strong, nonatomic) IBOutlet UITextView *boigraphyTextView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@property (nonatomic) NARArtists *artistSearch;
@property (nonatomic) BOOL isArtist;

@end

@implementation NARArtistDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
        
        if (self.artist == nil) {
            self.isArtist = NO;
        } else {
            self.isArtist = YES;
            [self updateViews];
        }
    }

- (void)updateViews {
    
    if (self.isArtist == YES) {
        self.searchBar.hidden = YES;
        self.title = self.artist.artist;
        
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.boigraphyTextView.hidden = NO;
        
        self.artistLabel.text = self.artist.artist;
        
        if (self.artist.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artist.yearFormed];
        }
        
        self.boigraphyTextView.text = self.artist.biography;
        
    } else {
        self.artistLabel.hidden = NO;
        self.yearFormed.hidden = NO;
        self.boigraphyTextView.hidden = NO;
        
        self.artistLabel.text = self.artistSearch.artist;
        
        if (self.artistSearch.yearFormed == 0) {
            self.yearFormed.text = @"N/A";
        } else {
            self.yearFormed.text = [NSString stringWithFormat:@"Formed in %d", self.artistSearch.yearFormed];
        }
        
        self.boigraphyTextView.text = self.artistSearch.biography;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.artistController fetchArtistsWithName:searchBar.text completion:^(NARArtists * _Nullable artist, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching artist!");
        }
        
        NSLog(@"Fetched artist: %@", artist);
        self.artistSearch = artist;
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            [self updateViews];
        });
    }];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    if (self.artistSearch == nil) {
        return;
    }
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self.artistSearch toDictionary] options:0 error:nil];
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory: NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    
    NSURL *url = [[directory URLByAppendingPathComponent:self.artistSearch.artist] URLByAppendingPathExtension:@"json"];
    
    NSLog(@"Directory: %@", directory);
    NSLog(@"UR: %@", url);
    
    [data writeToURL:url atomically:YES];
    
    [self.navigationController popToRootViewControllerAnimated:true];
}



@end
