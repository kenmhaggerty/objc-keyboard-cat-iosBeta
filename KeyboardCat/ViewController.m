//
//  ViewController.m
//  KeyboardCat
//
//  Created by Timothy Clem on 10/29/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *catImage = [UIImage animatedImageNamed:@"keyboard-cat-" duration:3];
    self.imageView.image = catImage;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillAppear:(NSNotification *)notification
{
    //
}

- (void)keyboardWillDisappear:(NSNotification *)notification
{
    //
}

@end
