//
//  NARArtistDetailViewController.h
//  Favorite Artists
//
//  Created by Nicolas Rios on 5/31/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NARArtistsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NARArtistDetailViewController : UIViewController


@property (nonatomic, assign)NARArtistsController *artistController;
@property (nonatomic, assign) NARArtists *artist;

@end

NS_ASSUME_NONNULL_END
