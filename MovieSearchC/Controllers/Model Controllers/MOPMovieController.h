//
//  MOPMovieController.h
//  MovieSearchC
//
//  Created by Maxwell Poffenbarger on 1/31/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@class MOPMovieInfo;

NS_ASSUME_NONNULL_BEGIN

@interface MOPMovieController : NSObject

+ (void)fetchMovies:(NSString *) searchTerm completion:(void (^) (NSArray<MOPMovieInfo *> *movie))completion;

+ (void)fetchMovieImage:(MOPMovieInfo *)movie completion:(void (^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
