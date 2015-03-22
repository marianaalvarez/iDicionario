//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Mariana Alvarez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Palavras.h"

@interface LetraViewController : UIViewController

@property UIButton *botao;
@property UIImageView *image;
@property (weak,nonatomic) NSTimer *timer;
@property Palavras *lista;
@property UILabel *letra;

@end
