//
//  UIAbbrev.h
//  Abbrev
//

#import <UIKit/UIKit.h>

/*
 * A
 */
@interface UIActionSheet (Abbrev)
+ (void)showActionSheetInView:(UIView *)view
                     delegate:(id <UIActionSheetDelegate>)delegate
                  cancelTitle:(NSString *)cancelTitle
                  otherTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;
+ (void)showActionSheetInView:(UIView *)view
                        title:(NSString *)title
                     delegate:(id <UIActionSheetDelegate>)delegate
                  cancelTitle:(NSString *)cancelTitle
             destructiveTitle:(NSString *)destructiveTitle
                  otherTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;
@end

@interface UIAlertView (Abbrev)
+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
          cancelTitle:(NSString *)cancelTitle;
+ (void)showWithMessage:(NSString *)message
               delegate:(id <UIAlertViewDelegate>)delegate
            cancelTitle:(NSString *)cancelTitle
            otherTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;
+ (void)showWithMessage:(NSString *)message
            cancelTitle:(NSString *)cancelTitle;
+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
             delegate:(id <UIAlertViewDelegate>)delegate
          cancelTitle:(NSString *)cancelTitle;
+ (void)showWithMessage:(NSString *)message
               delegate:(id <UIAlertViewDelegate>)delegate
            cancelTitle:(NSString *)cancelTitle;
+ (void)showWithTitle:(NSString *)title
              message:(NSString *)message
             delegate:(id <UIAlertViewDelegate>)delegate
          cancelTitle:(NSString *)cancelTitle
          otherTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;
@end

@interface UIApplication (Abbrev)
- (void)registerForRemoteNotification;
- (void)clearAll;
- (void)clearBadge;
@end


/*
 * B
 */
@interface UIButton (Abbrev)
@property (nonatomic, copy) NSString *fontName;
+ (UIButton *)buttonWithRetinaImage:(UIImage *)image
                             target:(id)target
                             action:(SEL)selector;
+ (UIButton *)buttonWithImage:(UIImage *)image
                       target:(id)target
                       action:(SEL)selector;
- (void)setNormalImage:(UIImage *)image;
- (void)setNormalTitle:(NSString *)title;
- (void)setBorderedTitle:(NSString *)title
             borderColor:(UIColor *)bColor
               textColor:(UIColor *)tColor;
- (void)setUnderLinedTitle:(NSString *)title textColor:(UIColor *)tColor;
- (void)setAttributedTitle:(NSString *)title attrDict:(NSDictionary *)attrDict;
@end


/*
 * C
 */
@interface UIColor (Abbrev)
+ (UIColor *)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha;
//+ (id)flatCarrotColor;
//+ (id)flatTurquoiseColor;
//+ (id)flatSkyBlueColor;
//+ (id)flatWhiteColor;
//+ (id)flatGrayColor;
@end

/*
 * D
 */
@interface UIDatePicker (Abbrev)
@end


/*
 * F
 */
@interface UIFont (Abbrev)
@end


/*
 * L
 */
@interface UILabel (Abbrev)
@property (nonatomic, copy) NSString* fontName;
+ (UILabel *)labelWithText:(NSString *)text;
+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font;
+ (UILabel *)labelWithUnderLinedText:(NSString *)text
                                font:(UIFont *)font;
+ (UILabel *)labelWithBorderedText:(NSString *)text
                              font:(UIFont *)font
                       borderColor:(UIColor *)bColor
                         textColor:(UIColor *)tColor;
+ (UILabel *)labelWithAttrText:(NSString *)text
                      attrDict:(NSDictionary *)attrDict;
@end

@interface UILocalNotification (Abbrev)
+ (UILocalNotification *)notificationWithTitle:(NSString *)title date:(NSDate *)date;
@end

/*
 * I
 */
@interface UIImage (Abbrev)
- (NSData *)toJPEGData;
- (NSData *)toPNGData;
- (UIImage *)cropTo:(CGRect)rect;
- (UIImage *)resizeTo:(CGSize)size;
- (UIImage *)rotateTo:(UIImageOrientation)orientation;
- (CGRect)centerRect;
- (UIImage *)overlay:(UIImage *)image alpha:(CGFloat)alpha;
+ (UIImage *)imageFromView:(UIView *)view;
+ (UIImage *)blurredImageFromView:(UIView *)view
                           radius:(CGFloat)radius
                        tintColor:(UIColor *)tint;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
                       maskImage:(UIImage *)maskImage;
@end

@interface UIImageView (Abbrev)
- (UIImageView *)rotate:(CGFloat)angle;
@end

/*
 * T
 */
@interface UITextField (Abbrev)
@property (nonatomic, copy) NSString *fontName;
- (void)setLeftMargin:(CGFloat)margin;
- (void)setLeftImage:(UIImage *)image;
@end

/*
 * V
 */
@interface UIView (Abbrev)
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
- (void)addSubview:(UIView *)child atOrigin:(CGPoint)origin;
- (void)addSubview:(UIView *)child atCenter:(CGPoint)center;
- (void)fadeoutWithDuration:(CGFloat)duration;
- (void)fadeinWithDuration:(CGFloat)duration;
@end

@interface UIViewController (Abbrev)
@end