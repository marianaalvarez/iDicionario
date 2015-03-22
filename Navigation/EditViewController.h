//
//  EditViewController.h
//  Navigation
//
//  Created by Mariana Alvarez on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Palavras.h"

@interface EditViewController : UIViewController

@property UITextField *texto;
@property UIImageView *imagem;
@property int *indice;
@property Palavras *lista;

@end
