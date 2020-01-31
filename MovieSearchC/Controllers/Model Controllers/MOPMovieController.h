//
//  MOPMovieController.h
//  MovieSearchC
//
//  Created by Maxwell Poffenbarger on 1/31/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MOPMovieInfo;

NS_ASSUME_NONNULL_BEGIN

@interface MOPMovieController : NSObject

+ (void)fetchMovies:(NSString *) searchTerm completion:(void (^) (NSArray<MOPMovieInfo *> *movie))completion;

@end

NS_ASSUME_NONNULL_END
