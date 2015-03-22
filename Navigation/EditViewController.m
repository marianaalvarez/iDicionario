//
//  EditViewController.m
//  Navigation
//
//  Created by Mariana Alvarez on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "EditViewController.h"
#import "Palavras.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lista = [Palavras sharedInstance];
    
    UIBarButtonItem *confirmar = [[UIBarButtonItem alloc]initWithTitle:@"Salvar" style:UIBarButtonItemStyleDone target:self action:@selector(salvar)];
    
    self.navigationItem.rightBarButtonItem = confirmar;
    
    _imagem = [[UIImageView alloc]initWithFrame:CGRectMake(115.f, 115.0f, 100.f, 100.f)];
    _imagem.image = [UIImage imageNamed:[_lista.palavras objectAtIndex:(NSUInteger)_indice  ]];
    
    _texto = [[UITextField alloc]initWithFrame:CGRectMake(150., 150., 100, 50)];
    _texto.text = [_lista.palavras objectAtIndex:(NSUInteger)_indice];
    _texto.center = self.view.center;
    _texto.textAlignment = NSTextAlignmentCenter;
    [_texto sizeToFit];
    
    [self.view addSubview:_imagem];
    [self.view addSubview:_texto];
    
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_texto resignFirstResponder];
}

-(void)salvar {
    [_lista.palavras insertObject:_texto.text atIndex:(NSUInteger)_indice];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
