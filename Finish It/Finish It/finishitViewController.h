//
//  finishitViewController.h
//  Finish It
//
//  Created by Colby Tobin on 7/18/14.
//  Copyright (c) 2014 StartingCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface finishitViewController : UIViewController{
    
    UIImageView *drawImage;
    NSDate * lastClick;
    CGPoint lastPoint;
    CGPoint currentPoint;
    CGPoint location;
    BOOL mouseSwiped;
}

@end
