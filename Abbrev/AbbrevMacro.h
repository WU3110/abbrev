//
//  AbbrevMacro.h
//  Abbrev
//

// fundamental
#define alloc(__class__) [__class__ alloc]

#define foreachKey(__elem__, __source__) for (__elem__ in [__source__ keyEnumerator])
#define foreachObj(__elem__, __source__) for (__elem__ in [__source__ objectEnumerator])
#define forIncrement(__var__, __n__) for (int __var__=0; __var__<__n__; ++__var__)
#define forIncrement_(__var__,__s__,__e__) for (int __var__=__s__; __var__<__e__; ++__var__)
#define forDecrement(__var__, __n__) for (int __var__=__n__; __var__>0; --__var__)
#define forDencrement_(__var__,__s__,__e__) for (int __var__=__s__; __var__>__e__; --__var__)

#define blockArg_(__ret_type__, __args__) __ret_type__ (^)(__args__)
#define blockArg(...) void (^)(__VA_ARGS__)

#define documentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#define string(...) [NSString stringWithFormat:__VA_ARGS__]

#define isNull(__obj__) [__obj__ isEqual:[NSNull null]]


//
// logging
//
#ifdef DEBUG

#define log_line printf("\n");
#define log(__obj__) \
printf("[LOG] %s @ Line %d\n%s\n\n", strrchr(__FILE__, '/')+1, __LINE__, \
[[NSString stringWithFormat:@"%@", __obj__] UTF8String]);

#define log_(...) \
printf("[LOG] %s @ Line %d\n%s\n\n", strrchr(__FILE__, '/')+1, __LINE__, \
[[NSString stringWithFormat:__VA_ARGS__] UTF8String]);

#define logSize(__size__) \
NSLog(@"%@", NSStringFromCGSize(__size__));

#define logRect(__rect__) \
NSLog(@"%@", NSStringFromCGRect(__rect__));

#define logPoint(__point__) \
NSLog(@"%@", NSStringFromCGPoint(__point__));

#else

#define log_line ;
#define log(__obj__) ;
#define log_(...) ;

#endif

//
// device
//
#define isRetina4 (winHeight > 500)
#define KEYBOARD_HEIGHT_LANDSCAPE 216
#define KEYBOARD_HEIGHT_PORTRAIT 162

//
// blocks
//
#define makeWeakSelf __weak typeof(self) weakSelf = self;
#define weaken(__name__, __src__) __weak typeof(__src__) __name__ = __src__;

//
// view
//
#define viewFromNib(__nib_name__) \
[[[NSBundle mainBundle] loadNibNamed:__nib_name__ \
owner:self \
options:nil] objectAtIndex:0]

#define navigationBarColor(__color__) [[UINavigationBar appearance] setBarTintColor:__color__];
#define navigationBarItemColor(__color__) [[UINavigationBar appearance] setTintColor:__color__];
//
// touch
//
#define getTouchPos(__v__) UITouch *touch = [touches anyObject]; \
CGPoint __v__ = [touch locationInView:self.view]

//
// localize
//
#define localizedString(__label__) NSLocalizedString(__label__, nil)

// singleton
#define singleton_h(__class__) \
+(__class__*)sharedInstance;

#define singleton_m(__class__, __init__) \
static __class__ *sharedInstance = nil;\
+(__class__*)sharedInstance{static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{sharedInstance = [[__class__ alloc] init];});return sharedInstance;}\
+(id)allocWithZone:(NSZone *)zone{static dispatch_once_t onceToken;dispatch_once(&onceToken,\
^{sharedInstance = [super allocWithZone:zone];});return sharedInstance;}\
-(id)init{self = [super init];if(self){__init__;}return self;}\
-(id)copyWithZone:(NSZone *)zone{return self;}\

// observer
#define value(__obj__, __key__) [__obj__ valueForKey:__key__]
#define myValue(__key__) [self valueForKey:__key__]
#define setValue(__obj__, __key__, __val__) [__obj__ setValue:__val__ forKey:__key__]
#define setMyValue(__key__, __val__) [self setValue:__val__ forKey:__key__]

#define winWidth [[UIScreen mainScreen] bounds].size.width
#define winHeight [[UIScreen mainScreen] bounds].size.height

#define className(__obj__) NSStringFromClass([__obj__ class])
#define isSubclass(__obj__, __parent__) [[__obj__ class] isSubclassOfClass:__parent__];
#define isKindOfClass(__obj__, __parent__) [[__obj__ class] isKindOfClass:__parent__];

#define appDelegate  ((AppDelegate *)[[UIApplication sharedApplication] delegate])

// http://flatuicolors.com/
#define colorWithRGB(__r__, __g__, __b__) [UIColor colorWithR:__r__ G:__g__ B:__b__ A:1.f];
#define colorWithRGBA(__r__, __g__, __b__, __a__) [UIColor colorWithR:__r__ G:__g__ B:__b__ A:__a__];
#define colorTurquise [UIColor colorWithHexString:@"1abc9c" alpha:1]
#define colorEmerald [UIColor colorWithHexString:@"2ecc71" alpha:1]
#define colorGreenSea [UIColor colorWithHexString:@"16a085" alpha:1]
#define colorNephritis [UIColor colorWithHexString:@"27ae60" alpha:1]
#define colorSunFlower [UIColor colorWithHexString:@"f1c40f" alpha:1]
#define colorCarrot [UIColor colorWithHexString:@"e67e22" alpha:1]
#define colorOrange [UIColor colorWithHexString:@"f39c12" alpha:1]
#define colorPumpkin [UIColor colorWithHexString:@"d35400" alpha:1]
#define colorPeterRiver [UIColor colorWithHexString:@"3498db" alpha:1]
#define colorBelizeHole [UIColor colorWithHexString:@"2980b9" alpha:1]
#define colorAmethyst [UIColor colorWithHexString:@"9b59b6" alpha:1]
#define colorWisteria [UIColor colorWithHexString:@"9b50ba" alpha:1]
#define colorAlizarin [UIColor colorWithHexString:@"e74c3c" alpha:1]
#define colorPomegranate [UIColor colorWithHexString:@"c0392b" alpha:1]
#define colorClouds [UIColor colorWithHexString:@"ecf0f1" alpha:1]
#define colorSilver [UIColor colorWithHexString:@"bdc3c7" alpha:1]
#define colorWetAsphalt [UIColor colorWithHexString:@"34495e" alpha:1]
#define colorMidnightBlue [UIColor colorWithHexString:@"2c3e50" alpha:1]
#define colorConcrete [UIColor colorWithHexString:@"95a5a6" alpha:1]
#define colorAsbestos [UIColor colorWithHexString:@"7f8c8d" alpha:1]
#define colorClear [UIColor clearColor];

#define mutableSet [NSMutableSet set]
#define mutableData [NSMutableData data]
#define mutableDict [NSMutableDictionary dictionary]
#define mutableString [NSMutableString string]
#define mutableArray [NSMutableArray array]

#define dictFromPlist(__file__)  [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__file__ ofType:@"plist"]]
#define arrayFromPlist(__file__) [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__file__ ofType:@"plist"]]


#define predicate(...) [NSPredicate predicateWithFormat:__VA_ARGS__]
#define sortDescriptor(__key__, __asc__)\
[NSSortDescriptor sortDescriptorWithKey:__key__ ascending:__asc__]

#define rectMake(__x__, __y__, __w__, __h__) CGRectMake(__x__, __y__, __w__, __h__)
#define sizeMake(__w__, __h__) CGSizeMake(__w__, __h__)
#define pointMake(__x__, __y__) CGPointMake(__x__, __y__)

#define safari(__url__) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:__url__]]

#define table_register_nib(__table__, __nib_name__) \
[__table__ registerNib:[UINib nibWithNibName:__nib_name__ bundle:nil] forCellReuseIdentifier:__nib_name__]

#define image(__filename__) [UIImage imageNamed:__filename__]

#define strEqual(__str1__, __str2__) [__str1__ isEqualToString:__str2__]
#define strEmpty(__str__) (!__str__ || [__str__ isEqualToString:@""])
#define str_append(__str1__, __str2__) [__str1__  stringByAppendingString:__str2__]
#define underscore(__str__) [__str__ toUnderscoreCase]
#define lowerCamel(__str__) [__str__ toLowerCamelCase]
#define upperCamel(__str__) [__str__ toUpperCamelCase]

#define arrayEmpty(__arr__) (!__arr__ || [__arr__ count] == 0)

#define udVal(__key__) [[NSUserDefaults standardUserDefaults] valueForKey:__key__]
#define udSetVal(__val__,__key__) [[NSUserDefaults standardUserDefaults] setValue:__val__ forKey:__key__]
#define udSynchronize [[NSUserDefaults standardUserDefaults] synchronize]

#define cast(__class__, __dst__, __src__) __class__ *__dst__ = (__class__ *)__src__;

