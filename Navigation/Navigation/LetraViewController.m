//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"
#import "EditViewController.h"

@implementation LetraViewController {
    CGPoint lastPoint;
}

static int indice = 0;


-(void) viewDidLoad {
    [super viewDidLoad];
    _lista = [Palavras sharedInstance];
    _lista.palavras = @[@"Alien",@"Balao",@"Coelho",@"Dori",@"Entei",@"Foguete",@"Gato",@"Hiena",@"Indio",@"Jacare",@"Kiwi",@"Leao",@"Monica",@"Nemo",@"Ornitorrinco",@"Pikachu",@"Queijo",@"Rato",@"Superman",@"Timao",@"Urso",@"Videogame",@"Wolverine",@"Xmen",@"Yugioh",@"Zumbi"];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    _letra = [[UILabel alloc]initWithFrame:CGRectMake(125, 100, 100.f, 100.f)];
    _letra.textColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = next;
    self.navigationItem.leftBarButtonItem = back;
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(115.f, 115.0f, 100.f, 100.f)];
    
    _botao = [UIButton
                                        buttonWithType:UIButtonTypeSystem];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 60, 320, 50)];
    [toolBar sizeToFit];
    UIBarButtonItem *buttonItem = [[ UIBarButtonItem alloc ] initWithTitle: @"Edit"
                                                    style: UIBarButtonItemStyleBordered
                                                   target: self
                                                   action: @selector( edit ) ];
    toolBar.items = [ NSArray arrayWithObject: buttonItem ];
    
    [self.view addSubview:_letra];
    [self.view addSubview:_image];
    [self.view addSubview:_botao];
    [self.view addSubview:toolBar];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
 
}

-(void)edit {
    EditViewController *edit = [[EditViewController alloc]init];
    edit.indice = indice;
    [self.navigationController pushViewController:edit
                                         animated:YES];
    
}



-(void)viewWillAppear:(BOOL)animated {
    [_botao
     setTitle:[_lista.palavras objectAtIndex:indice]
     forState:UIControlStateNormal];
    [_botao sizeToFit];
    _botao.center = self.view.center;
    _letra.text = [[_lista.palavras objectAtIndex:indice] substringToIndex:1];
    _image.image = [UIImage imageNamed:_lista.palavras[indice]];
    _image.frame = CGRectMake(115.f, 115.0f, 100.f, 100.f);
    [self.view addSubview:_image];
    
}

-(void)viewDidAppear:(BOOL)animated {
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.1];
    [shake setRepeatCount:2];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(_image.center.x - 5, _image.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(_image.center.x + 5, _image.center.y)]];
    
    [_image.layer addAnimation:shake forKey:@"position"];
}

-(void)parar {
    [_timer invalidate];
    _timer = nil;
}
-(void)next:(id)sender {
    indice++;
    if (indice == 26) {
        indice = 0;
    }
    
    if (self.navigationController.viewControllers.count < 2) {
        
        LetraViewController *proximo = [[LetraViewController alloc]init];
        NSLog(@"\n\n\n%lu", [self.navigationController.viewControllers count]);
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

-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
    self.image.center = touchLocation;
    
}

@end
