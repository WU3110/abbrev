//
//  UIAbbrev.m
//  Abbrev
//
//  Created by TomokiNakamaru on 11/12/13.
//  Copyright (c) 2013 TomokiNakamaru. All rights reserved.
//

#import "UIAbbrev.h"

//
// ActionSheet
//
@implementation UIActionSheet (Abbrev)
@end


//
// AlertView
//
@implementation UIAlertView (Abbrev)
@end


//
// Application
//
@implementation UIApplication (Abbrev)
@end


//
// Button
//
@implementation UIButton (Abbrev)
- (void)setNormalImage:(UIImage *)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setNormalTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setBorderedTitle:(NSString *)title borderColor:(UIColor *)bColor textColor:(UIColor *)tColor
{
    NSDictionary *attrDict = @{NSForegroundColorAttributeName : tColor,
                               NSStrokeColorAttributeName : bColor,
                               NSStrokeWidthAttributeName : @(-3.0)};
    NSMutableAttributedString *attrTitle
    = [[NSMutableAttributedString alloc] initWithString:title attributes:attrDict];
    [self setAttributedTitle:attrTitle forState:UIControlStateNormal];
}

- (void)setUnderLinedTitle:(NSString *)title textColor:(UIColor *)tColor
{
    NSDictionary *attrDict = @{NSUnderlineStyleAttributeName : @(1),
                               NSForegroundColorAttributeName : tColor};
    NSMutableAttributedString *attrTitle
    = [[NSMutableAttributedString alloc] initWithString:title
                                             attributes:attrDict];
    [self setAttributedTitle:attrTitle forState:UIControlStateNormal];
}

- (void)setAttributedTitle:(NSString *)title attrDict:(NSDictionary *)attrDict
{
    NSMutableAttributedString *attrTitle
    = [[NSMutableAttributedString alloc] initWithString:title attributes:attrDict];
    [self setAttributedTitle:attrTitle forState:UIControlStateNormal];
}

- (NSString *)fontName
{
    return self.titleLabel.fontName;
}

- (void)setFontName:(NSString *)fontName
{
    self.titleLabel.font = [UIFont fontWithName:fontName size:self.titleLabel.font.pointSize];
}
@end

//
// Color
//
@implementation UIColor (Abbrev)
+ (UIColor *)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha
{
    return [UIColor colorWithRed:red*1.f/255.f
                           green:green*1.f/255.f
                            blue:blue*1.f/255.f
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)a
{
    NSScanner *colorScanner = [NSScanner scannerWithString:hex];
    unsigned int color;
    if ( ![colorScanner scanHexInt:&color] )
        return nil;
    CGFloat r = ((color & 0xFF0000) >> 16)/255.0f;
    CGFloat g = ((color & 0x00FF00) >> 8) /255.0f;
    CGFloat b =  (color & 0x0000FF) /255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end

//
// Label
//
@implementation UILabel (Abbrev)
+ (UILabel *)labelWithText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = text;
    [label sizeToFit];
    return label;
}

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = text;
    label.font = font;
    [label sizeToFit];
    return label;
}

+ (UILabel *)labelWithUnderLinedText:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    NSDictionary *attrDict = @{NSUnderlineStyleAttributeName : @(1)};
    NSMutableAttributedString *attrText
    = [[NSMutableAttributedString alloc] initWithString:text
                                             attributes:attrDict];
    label.attributedText = attrText;
    [label sizeToFit];
    return label;
}

+ (UILabel *)labelWithBorderedText:(NSString *)text
                              font:(UIFont *)font
                       borderColor:(UIColor *)bColor
                         textColor:(UIColor *)tColor
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    NSDictionary *attrDict = @{NSForegroundColorAttributeName : tColor,
                               NSStrokeColorAttributeName : bColor,
                               NSStrokeWidthAttributeName : @(-3.0)};
    NSMutableAttributedString *attrText
    = [[NSMutableAttributedString alloc] initWithString:text attributes:attrDict];
    label.attributedText = attrText;
    [label sizeToFit];
    return label;
}

+ (UILabel *)labelWithAttrText:(NSString *)text attrDict:(NSDictionary *)attrDict
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    NSMutableAttributedString *attrText
    = [[NSMutableAttributedString alloc] initWithString:text attributes:attrDict];
    label.attributedText = attrText;
    [label sizeToFit];
    return label;
}

- (NSString *)fontName
{
    return self.font.fontName;
}

- (void)setFontName:(NSString *)fontName
{
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}
@end

//
// Image
//
@implementation UIImage (Abbrev)

- (NSData *)toJPEGData
{
    return [[NSData alloc] initWithData:UIImageJPEGRepresentation(self, 1.f)];
}

- (NSData *)toPNGData
{
    return [[NSData alloc] initWithData:UIImagePNGRepresentation(self)];
}

- (UIImage *)cropTo:(CGRect)rect;
{
    CGImageRef imgRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *croppedImg = [UIImage imageWithCGImage:imgRef
                                              scale:self.scale
                                        orientation:UIImageOrientationUp];
    CGImageRelease(imgRef);
    return croppedImg;
    
}

- (UIImage *)resizeTo:(CGSize)size
{
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height));
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImg;
}

- (UIImage *)rotateTo:(UIImageOrientation)orientation
{
    CGImageRef imgRef = CGImageCreateWithImageInRect(self.CGImage, CGRectMake(0, 0, self.size.width, self.size.height));
    UIImage *rotatedimg = [UIImage imageWithCGImage:imgRef scale:self.scale orientation:orientation];
    CGImageRelease(imgRef);
    return rotatedimg;
}

- (CGRect)centerRect;
{
    NSInteger width = self.size.width*2;
    NSInteger height = self.size.height*2;
    
    if (width < height)
    {
        return CGRectMake(0, (height-width)/2, width, width);
    }
    else
    {
        return CGRectMake((width-height)/2, 0, height, height);
    }
}

- (UIImage *)overlay:(UIImage *)image alpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 1.0);
    [self drawInRect:CGRectMake(0,0,self.size.width,self.size.height)];
    [image drawInRect:CGRectMake(0,0,self.size.width,self.size.height)
            blendMode:kCGBlendModeNormal
                alpha:alpha];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageFromView:(UIView *)view
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [view.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end


//
// LocalNotification
//
@implementation UILocalNotification (Abbrev)
+ (UILocalNotification *)notificationWithTitle:(NSString *)title date:(NSDate *)date
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = title;
    localNotification.fireDate = date;
    return localNotification;
}
@end

//
// ImageView
//
@implementation UIImageView (Abbrev)
- (UIImageView *)rotate:(CGFloat)angle
{
    self.layer.affineTransform = CGAffineTransformMakeRotation(angle);
    return self;
}
@end

//
// TextField
//
@implementation UITextField (Abbrev)
- (NSString *)fontName
{
    return self.font.fontName;
}

- (void)setFontName:(NSString *)fontName
{
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}

- (void)setLeftMargin:(CGFloat)margin
{
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, margin, 1)];
}

- (void)setLeftImage:(UIImage *)image
{
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = [[UIImageView alloc] initWithImage:image];
}
@end

//
// View
//
@implementation UIView (Abbrev)
- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)originX
{
    return self.frame.origin.x;
}

- (void)setOriginX:(CGFloat)originX
{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)originY
{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end

//
// ViewController
//
@implementation UIViewController (Abbrev)
@end

















