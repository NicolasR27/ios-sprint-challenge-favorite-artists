//
//  NARArtist+NSJSONSerialization.h
//  Favorite Artists
//
//  Created by Nicolas Rios on 5/31/20.
//  Copyright © 2020 Nicolas Rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"NARArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface NARArtist_NSJSONSerialization : NSObject


- (NSDictionary *)toDictionary;
@end

NS_ASSUME_NONNULL_END
