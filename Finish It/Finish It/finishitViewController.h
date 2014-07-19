//
//  finishitViewController.h
//  Finish It
//
//  Created by Colby Tobin on 7/18/14.
//  Copyright (c) 2014 StartingCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface finishitViewController : UIViewController{
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
}

@property(strong,nonatomic)IBOutlet UIImageView *tempDrawImage;
@property(strong,nonatomic)IBOutlet UIImageView *mainImage;
@end
