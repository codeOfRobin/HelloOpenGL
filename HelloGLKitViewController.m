//
//  HelloGLKitViewController.m
//  HelloOpenGL
//
//  Created by Robin Malhotra on 30/10/13.
//  Copyright (c) 2013 Robin's code kitchen. All rights reserved.
//

#import "HelloGLKitViewController.h"

@interface HelloGLKitViewController ()
{
    float _curred;
    BOOL increase;
}

@property(nonatomic,strong)EAGLContext *Context;


@end

@implementation HelloGLKitViewController

@synthesize Context=_Context;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.Context=[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.Context)
    {
        NSLog(@"Faiiled to create a EAGLContext");
    }
    
	// Do any additional setup after loading the view.
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    
    if ([EAGLContext currentContext]==self.Context)
    {
        [EAGLContext setCurrentContext:nil];
    }
    
    self.Context=nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
