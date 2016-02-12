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
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *constraintTextFieldBottom;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *catImage = [UIImage animatedImageNamed:@"keyboard-cat-" duration:3];
    self.imageView.image = catImage;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    
    [self.imageView setUserInteractionEnabled:YES];
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewWasTapped:)]];
}

- (void)keyboardWillAppear:(NSNotification *)notification
{
    CGRect keyboardRect = [[notification.userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration = 0;
    [[notification.userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [self.constraintTextFieldBottom setConstant:20.0f+keyboardRect.size.height];
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillDisappear:(NSNotification *)notification
{
    NSTimeInterval animationDuration = 0;
    [[notification.userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [self.constraintTextFieldBottom setConstant:20.0f];
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)imageViewWasTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self.view endEditing:YES];
}

@end
