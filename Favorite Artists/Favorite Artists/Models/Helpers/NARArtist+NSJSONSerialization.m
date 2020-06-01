//
//  NARArtist+NSJSONSerialization.m
//  Favorite Artists
//
//  Created by Nicolas Rios on 5/31/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//


#import "NARArtist+NSJSONSerialization.h"

@implementation NARArtists (NSJSONSerialization)

- (NSDictionary *)toDictionary {
    
    NSDictionary *dictionary = @{@"strArtist": self.artist,
                                 @"intFormedYear": [[NSNumber alloc] initWithInt:self.yearFormed],
                                 @"strBiographyEN": self.biography
    };
    
    return dictionary;
}

@end
