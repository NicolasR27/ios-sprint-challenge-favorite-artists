//
//  NARArtist+NSJSONSerialization.h
//  Favorite Artists
//
//  Created by Nicolas Rios on 5/31/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"NARArtists.h"

NS_ASSUME_NONNULL_BEGIN

@interface NARArtists (NSJSONSerialization)

- (NSDictionary *)toDictionary;


@end

NS_ASSUME_NONNULL_END
