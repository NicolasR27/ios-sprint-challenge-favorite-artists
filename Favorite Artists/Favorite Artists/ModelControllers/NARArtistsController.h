//
//  NARArtistController.h
//  Favorite Artists
//
//  Created by Nicolas Rios on 5/31/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NARArtists;

typedef void (^ArtistFetchCompletionHandler)(NARArtists* _Nullable artist, NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN@interface

NARArtistsController : NSObject

- (void) fetchArtistsWithName:(NSString *)name completion:(ArtistFetchCompletionHandler)completion;

- (NSArray *)fetchSavedArtists;

@end

NS_ASSUME_NONNULL_END
