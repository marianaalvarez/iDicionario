//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"

@implementation LetraViewController

static int indice = 0;


-(void) viewDidLoad {
    [super viewDidLoad];
    _palavras = @[@"Alien",@"Balao",@"Coelho",@"Dori",@"Entei",@"Foguete",@"Gato",@"Hiena",@"Indio",@"Jacare",@"Kiwi",@"Leao",@"Monica",@"Nemo",@"Ornitorrinco",@"Pikachu",@"Queijo",@"Rato",@"Superman",@"Timao",@"Urso",@"Videogame",@"Wolverine",@"Xmen",@"Yugioh",@"Zumbi"];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    self.navigationItem.leftBarButtonItem=back;
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(115.f, 115.0f, 100.f, 100.f)];
    
    [self.view addSubview:_image];
    
    _botao = [UIButton
                                        buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:_botao];
    
 
}

-(void)viewWillAppear:(BOOL)animated {
    NSString *letra = [[_palavras objectAtIndex:indice] substringToIndex:1];
    self.title = letra;
    [_botao
     setTitle:[_palavras objectAtIndex:indice]
     forState:UIControlStateNormal];
    [_botao sizeToFit];
    _botao.center = self.view.center;
    _image.image = [UIImage imageNamed:_palavras[indice]];
    
}



-(void)next:(id)sender {
    indice++;
    if (indice == 26) {
        indice = 0;
    }
    
    if (self.navigationController.viewControllers.count < 2) {
        
        LetraViewController *proximo = [[LetraViewController alloc]init];
        
        [self.navigationController pushViewController:proximo
                                             animated:YES];
    
    } else {
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
        
        LetraViewController *proximo = [array objectAtIndex:0];
        [array removeObjectAtIndex:0];
        [self.navigationController setViewControllers:array];
        [self.navigationController pushViewController:proximo
                                             animated:YES];
    }
    
}

-(void)back:(id)sender {
    indice--;
    
    if (indice < 0) {
        indice = 25;
    }
    
    if (self.navigationController.viewControllers.count < 2) {
        
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
        
        LetraViewController *proximo = [[LetraViewController alloc]init];
        [array insertObject:proximo atIndex:0];
        [self.navigationController setViewControllers:array];
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
