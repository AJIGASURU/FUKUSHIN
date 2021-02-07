//
//  BallButton.h
//  PHP
//
//  Created by MacUser on 2021/01/21.
//

/*
#ifndef BallButton_h
#define BallButton_h
#endif
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BallButton : NSObject

@property UIImage *image;
@property UIButton *button;
@property bool touched;
@property CGFloat scale;

-(void)expantion:(CGFloat)coef;
-(void)reset;

@end
