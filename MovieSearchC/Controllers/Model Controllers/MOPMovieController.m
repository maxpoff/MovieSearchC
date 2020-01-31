//
//  MOPMovieController.m
//  MovieSearchC
//
//  Created by Maxwell Poffenbarger on 1/31/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

#import "MOPMovieController.h"
#import "MOPMovieInfo.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3/search/movie";
static NSString * const apiQuery = @"api_key";
static NSString * const apiKeyKey = @"c7b605a4da539f0f14265ab6635a1b32";
static NSString * const movieKey = @"query";

@implementation MOPMovieController

+ (void)fetchMovies:(NSString *)searchTerm completion:(void (^)(NSArray<MOPMovieInfo *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:apiQuery value:apiKeyKey];
    NSURLQueryItem *movie = [[NSURLQueryItem alloc] initWithName:movieKey value:searchTerm];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    components.queryItems = @[apiKey, movie];
   
    
    NSURL *finalURL = components.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing JSON data: %@", error);
                completion(nil);
                return;
            }
            
            NSArray *results = topLevelDictionary[@"results"];
            
            NSMutableArray *movieArray = [[NSMutableArray alloc] init];
            
            for (NSDictionary *movieDictionary in results)
            {
                MOPMovieInfo *movie = [[MOPMovieInfo alloc] initWithDictionary:movieDictionary];
                [movieArray addObject:movie];
            }
            
            completion(movieArray);
        }
    }] resume];
}
@end
