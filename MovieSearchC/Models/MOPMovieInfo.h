//
//  MOPMovieInfo.h
//  MovieSearchC
//
//  Created by Maxwell Poffenbarger on 1/31/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOPMovieInfo : NSObject

@property (nonatomic, copy, readonly)NSString *title;
@property (nonatomic, copy, readonly)NSString *summary;
@property (nonatomic, readonly)NSInteger rating;
@property (nonatomic, copy, readonly, nullable)NSString *posterPath;

-(instancetype)initWithTitle:(NSString *)title
                     summary:(NSString *)summary
                      rating:(NSInteger)rating
                  posterPath:(NSString *)posterPath;
@end

@interface MOPMovieInfo (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
