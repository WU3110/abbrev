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
+ (void)showActionSheetInView:(UIView *)view
                     delegate:(id<UIActionSheetDelegate>)delegate
                  cancelTitle:(NSString *)cancelTitle
                  otherTitles:(NSString *)otherTitles, ...
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:delegate
                                                    cancelButtonTitle:cancelTitle
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:otherTitles, nil];
    [actionSheet showInView:view];
}

+ (void)showActionSheetInView:(UIView *)view
                        title:(NSString *)title
                     delegate:(id<UIActionSheetDelegate>)delegate
                  cancelTitle:(NSString *)cancelTitle
             destructiveTitle:(NSString *)destructiveTitle
                  otherTitles:(NSString *)otherTitles, ...
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                             delegate:delegate
                                                    cancelButtonTitle:cancelTitle
                                               destructiveButtonTitle:destructiveTitle
                                                    otherButtonTitles:otherTitles, nil];
    [actionSheet showInView:view];
}
@end


//
// AlertView
//
@implementation UIAlertView (Abbrev)
+ (void)showWithMessage:(NSString *)message
            cancelTitle:(NSString *)cancelTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)showWithMessage:(NSString *)message
               delegate:(id<UIAlertViewDelegate>)delegate
            cancelTitle:(NSString *)cancelTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)showWithMessage:(NSString *)message
               delegate:(id<UIAlertViewDelegate>)delegate
            cancelTitle:(NSString *)cancelTitle
            otherTitles:(NSString *)otherTitles, ...
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:otherTitles, nil];
    [alert show];
}

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
          cancelTitle:(NSString *)cancelTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
             delegate:(id<UIAlertViewDelegate>)delegate
          cancelTitle:(NSString *)cancelTitle
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
             delegate:(id<UIAlertViewDelegate>)delegate
          cancelTitle:(NSString *)cancelTitle
          otherTitles:(NSString *)otherTitles, ...
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles:otherTitles, nil];
    [alert show];
}
@end


//
// Application
//
@implementation UIApplication (Abbrev)
- (void)registerForRemoteNotification
{
    
}

- (void)clearAll
{
    
}

- (void)clearBadge
{
    
}
@end


//
// Button
//
@implementation UIButton (Abbrev)
+ (UIButton *)buttonWithRetinaImage:(UIImage *)image
                             target:(id)target
                             action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image
                      forState:UIControlStateNormal];
    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, image.size.width/2, image.size.height/2)];
    
    return button;
    
}

+ (UIButton *)buttonWithImage:(UIImage *)image
                       target:(id)target
                       action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:image
                      forState:UIControlStateNormal];
    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    return button;
}

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
+ (id)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha
{
    return [UIColor colorWithRed:red*1.f/255.f
                           green:green*1.f/255.f
                            blue:blue*1.f/255.f
                           alpha:alpha];
}

+ (id)colorWithHexString:(NSString *)hex alpha:(CGFloat)a
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

//+ (id)flatCarrotColor
//{
//    return [UIColor colorWithR:230 G:126 B:34 A:1];
//}
//
//+ (id)flatTurquoiseColor
//{
//    return [UIColor colorWithR:26 G:188 B:156 A:1];
//}
//
//+ (id)flatSkyBlueColor
//{
//    return [UIColor colorWithR:52 G:152 B:219 A:1];
//}
//
//+ (id)flatWhiteColor
//{
//    return [UIColor colorWithR:236 G:240 B:241 A:1];
//}
//
//+ (id)flatGrayColor
//{
//    return [UIColor colorWithR:149 G:165 B:166 A:1];
//}
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

@import Accelerate;

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

+ (UIImage *)blurredImageFromView:(UIView *)view
                           radius:(CGFloat)radius 
                        tintColor:(UIColor *)tint
{
    UIImage *image = [UIImage imageFromView:view];
    image = [image applyBlurWithRadius:radius
                             tintColor:tint
                             maskImage:nil];
    
    return image;
}

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
                       maskImage:(UIImage *)maskImage
{
    // Check pre-conditions.
    if (self.size.width < 1 || self.size.height < 1)
    {
        NSLog (@"*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@", self.size.width, self.size.height, self);
        return nil;
    }
    if (!self.CGImage)
    {
        NSLog (@"*** error: image must be backed by a CGImage: %@", self);
        return nil;
    }
    if (maskImage && !maskImage.CGImage)
    {
        NSLog (@"*** error: maskImage must be backed by a CGImage: %@", maskImage);
        return nil;
    }
    
    CGRect imageRect = { CGPointZero, self.size };
    UIImage *effectImage = self;
    
    BOOL hasBlur = blurRadius > FLT_EPSILON;
    BOOL hasSaturationChange = fabs(1.f - 1.) > FLT_EPSILON;
    if (hasBlur || hasSaturationChange) {
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -self.size.height);
        CGContextDrawImage(effectInContext, imageRect, self.CGImage);
        
        vImage_Buffer effectInBuffer;
        effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
        
        UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
        
        if (hasBlur)
        {
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            NSUInteger radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if (radius % 2 != 1)
                radius += 1;
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, (uint32_t)radius, (uint32_t)radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, (uint32_t)radius, (uint32_t)radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, (uint32_t)radius, (uint32_t)radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if (hasSaturationChange)
        {
            CGFloat s = 1.f;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                0,                    0,                    0,  1,
            };
            const int32_t divisor = 256;
            NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
            int16_t saturationMatrix[matrixSize];
            for (NSUInteger i = 0; i < matrixSize; ++i)
            {
                saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if (hasBlur)
            {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            }
            else
            {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if (!effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    // Set up output context.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.size.height);
    
    // Draw base image.
    CGContextDrawImage(outputContext, imageRect, self.CGImage);
    
    // Draw effect image.
    if (hasBlur)
    {
        CGContextSaveGState(outputContext);
        if (maskImage)
        {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }
    
    // Add in color tint.
    if (tintColor)
    {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }
    
    // Output image is ready.
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end


//
// LocalNotification
//
@implementation UILocalNotification (Abbrev)
+ (UILocalNotification *)notificationWithTitle:(NSString *)title date:(NSDate *)date
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
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

- (void)addSubview:(UIView *)child atOrigin:(CGPoint)origin
{
    [child setFrame:CGRectMake(origin.x, origin.y, child.width, child.height)];
    [self addSubview:child];
}

- (void)addSubview:(UIView *)child atCenter:(CGPoint)center
{
    [child setCenter:center];
    [self addSubview:child];
}

- (void)fadeoutWithDuration:(CGFloat)duration
{
    [UIView animateWithDuration:duration
                     animations:^{
                         self.alpha = 0.f;
                     }];
}

- (void)fadeinWithDuration:(CGFloat)duration
{
    [UIView animateWithDuration:duration
                     animations:^{
                         self.alpha = 1.f;
                     }];
}
@end

//
// ViewController
//
@implementation UIViewController (Abbrev)
@end

















