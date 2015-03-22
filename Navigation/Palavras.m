//
//  Palavras.m
//  Navigation
//
//  Created by Mariana Alvarez on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Palavras.h"

@implementation Palavras

-(instancetype)init{
    self = [super init];
    if (self) {
        _palavras = [[NSMutableArray alloc]initWithArray: @[@"Alien",@"Balao",@"Coelho",@"Dori",@"Entei",@"Foguete",@"Gato",@"Hiena",@"Indio",@"Jacare",@"Kiwi",@"Leao",@"Monica",@"Nemo",@"Ornitorrinco",@"Pikachu",@"Queijo",@"Rato",@"Superman",@"Timao",@"Urso",@"Videogame",@"Wolverine",@"Xmen",@"Yugioh",@"Zumbi"]];
    }
    return self;
}

+(instancetype)sharedInstance {
    
    static dispatch_once_t onceToken = 0;
    
    __strong static Palavras *instance = nil;
    
    dispatch_once(&onceToken,^{
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

@end
