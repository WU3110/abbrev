//
//  UIAbbrev.h
//  Abbrev
//

#import <UIKit/UIKit.h>

/*
 * A
 */
@interface UIActionSheet (Abbrev)

@end

@interface UIAlertView (Abbrev)

@end

@interface UIApplication (Abbrev)
@end


/*
 * B
 */
@interface UIButton (Abbrev)
@property (nonatomic, copy) NSString *fontName;
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

- (void)ab_adjustHeightWithMaxWidth:(CGFloat)maxWidth
                     constraint:(NSLayoutConstraint *)constraint;
- (void)ab_adjustHeightWithMaxSize:(CGSize)maxSize
                     constraint:(NSLayoutConstraint *)constraint;
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
@end

@interface UIViewController (Abbrev)
@end