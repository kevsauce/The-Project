//
//  finishitViewController.m
//  Finish It
//
//  Created by Colby Tobin on 7/18/14.
//  Copyright (c) 2014 StartingCompany. All rights reserved.

#import "finishitViewController.h"

@interface finishitViewController ()

@end

@implementation finishitViewController

- (void)viewDidLoad
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	drawImage.image = [defaults objectForKey:@"drawImageKey"];
	drawImage = [[UIImageView alloc] initWithImage:nil];
	drawImage.frame = self.view.frame;
	[self.view addSubview:drawImage];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	
	if ([touch tapCount] == 2) {
        drawImage.image = nil;
	}
	
    
	location = [touch locationInView:touch.view];
	lastClick = [NSDate date];
	
    lastPoint = [touch locationInView:self.view];
    lastPoint.y -= 0;
	
    
	[super touchesBegan: touches withEvent: event];
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	mouseSwiped = YES;
	
	UITouch *touch = [touches anyObject];
	currentPoint = [touch locationInView:self.view];
	
    UIGraphicsBeginImageContext(CGSizeMake(320, 568));
    [drawImage.image drawInRect:CGRectMake(0, 0, 320, 568)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 22.0/255.0, 77.0/255.0, 0, 1);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    
    [drawImage setFrame:CGRectMake(0, 0, 320, 568)];
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    lastPoint = currentPoint;
	
	[self.view addSubview:drawImage];
}


@end
