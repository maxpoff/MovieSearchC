//
//  MOPMovieInfo.m
//  MovieSearchC
//
//  Created by Maxwell Poffenbarger on 1/31/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPMovieInfo.h"

static NSString * const titleKey = @"original_title";
static NSString * const summaryKey = @"overview";
static NSString * const ratingKey = @"vote_average";
static NSString * const posterPathKey = @"poster_path";

@implementation MOPMovieInfo

- (instancetype)initWithTitle:(NSString *)title summary:(NSString *)summary rating:(NSInteger)rating posterPath:(nonnull NSString *)posterPath
{
    self = [super init];
    if (self)
    {
        _title = title;
        _summary = summary;
        _rating = rating;
        _posterPath = posterPath;
    }
    return self;
}
@end

@implementation MOPMovieInfo (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary
{
    NSString *title = dictionary[titleKey];
    NSString *summary = dictionary[summaryKey];
    NSInteger rating = [dictionary[ratingKey] intValue];
    NSString *posterPath = dictionary[posterPathKey];
    
    return [self initWithTitle:title summary:summary rating:rating posterPath:posterPath];
}
@end
