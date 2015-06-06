//
//  FLKViewController.m
//  framed
//
//  Created by TRM on 6/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "FLKViewController.h"
#import "UIView+FLKAutoLayout.h"

@interface FLKViewController ()

@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *greenView;
@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UIView *yellowView;

@end

@implementation FLKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.greenView = [UIView new];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.blueView = [[UIView alloc] init];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    self.yellowView = [UIView new];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowView];
    
    [self layoutDiagonalSquares];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutDiagonalSquares
{
    [self.redView alignTop:@"20" leading:@"0" toView:self.view];
    [self.redView constrainWidthToView:self.view predicate:@"*.25"];
    [self.redView alignAttribute:NSLayoutAttributeHeight toAttribute:NSLayoutAttributeWidth ofView:self.redView predicate:@"0"];
    
    [self.greenView constrainLeadingSpaceToView:self.redView predicate:@"0"];
    [self.greenView constrainTopSpaceToView:self.redView predicate:@"0"];
    
    [self.blueView constrainLeadingSpaceToView:self.greenView predicate:@"0"];
    [self.blueView constrainTopSpaceToView:self.greenView predicate:@"0"];
    
    [self.yellowView constrainLeadingSpaceToView:self.blueView predicate:@"0"];
    [self.yellowView constrainTopSpaceToView:self.blueView predicate:@"0"];
    
    [UIView equalHeightForViews:@[self.redView, self.greenView, self.blueView, self.yellowView]];
    [UIView equalWidthForViews:@[self.redView, self.greenView, self.blueView, self.yellowView]];
    
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
