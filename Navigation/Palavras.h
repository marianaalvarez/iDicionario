//
//  Palavras.h
//  Navigation
//
//  Created by Mariana Alvarez on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Palavras : NSObject

@property NSMutableArray *palavras;

-(instancetype)init;
+(instancetype)sharedInstance;

@end
