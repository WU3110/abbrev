//
//  AbbrevMacro.h
//  Abbrev
//

// fundamental
#define STRING(...) [NSString stringWithFormat:__VA_ARGS__]
#define IS_NULL(__obj__) [__obj__ isEqual:[NSNull null]]
#define IS_GREATER_THAN_iOS_7_1 \
return floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1;

//
// blocks
//
#define WEAKEN(__name__, __src__) __weak typeof(__src__) __name__ = __src__;

//
// view
//
#define VIEW_FROM_NIB_NAME(__nib_name__) \
[[[NSBundle mainBundle] loadNibNamed:__nib_name__ owner:self \
                             options:nil] objectAtIndex:0]


//
// localize
//
#define LOCALIZED_STRING(__label__) NSLocalizedString(__label__, nil)

// singleton
#define SINGLETON_H(__class__) \
+(__class__*)sharedInstance;

#define SINGLETON_M(__class__, __init__) \
static __class__ *sharedInstance = nil;\
+(__class__*)sharedInstance{static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{sharedInstance = [[__class__ alloc] init];});return sharedInstance;}\
+(id)allocWithZone:(NSZone *)zone{static dispatch_once_t onceToken;dispatch_once(&onceToken,\
^{sharedInstance = [super allocWithZone:zone];});return sharedInstance;}\
-(id)init{self = [super init];if(self){__init__;}return self;}\
-(id)copyWithZone:(NSZone *)zone{return self;}\


// Util
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREEN_HEIGHT CGRectGetHeight([[UIScreen mainScreen] bounds])
#define SCREEN_WIDTH_WITH_OFFSET(__offset__) CGRectGetWidth([UIScreen mainScreen].bounds) - __offset__
#define SCREEN_HEIGHT_WITH_OFFSET(__offset__) CGRectGetHeight([[UIScreen mainScreen] bounds]) - __offset__

#define CLASS_NAME(__obj__) NSStringFromClass([__obj__ class])
#define IS_SUBCLASS(__obj__, __target__) [[__obj__ class] isSubclassOfClass:__target__];
#define IS_KIND_OF_CLASS(__obj__, __target__) [[__obj__ class] isKindOfClass:__target__];
#define IS_NULL(__obj__) [__obj__ isEqual:[NSNull null]]
#define NIL_OR_OBJ(__obj__) [__obj__ isEqual:[NSNull null]] ? nil : __obj__

// http://flatuicolors.com/
#define COLOR_WITH_RGB(__r__, __g__, __b__) [UIColor colorWithR:__r__ G:__g__ B:__b__ A:1.f];
#define COLOR_WITH_RGBA(__r__, __g__, __b__, __a__) [UIColor colorWithR:__r__ G:__g__ B:__b__ A:__a__];
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

#define MUTABLE_SET [NSMutableSet set]
#define MUTABLE_DATA [NSMutableData data]
#define MUTABLE_DICTIONARY [NSMutableDictionary dictionary]
#define MUTABLE_STRING [NSMutableString string]
#define MUTABLE_ARRAY [NSMutableArray array]

#define DICTIONARY_FROM_PLIST_NAMED(__file__) \
[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__file__ ofType:@"plist"]]
#define ARRAY_FROM_PLIST_NAMED(__file__) \
[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__file__ ofType:@"plist"]]


#define PREDICATE(...) [NSPredicate predicateWithFormat:__VA_ARGS__]
#define AND_PREDICATE(__array__) [NSCompoundPredicate andPredicateWithSubpredicates:__array__]
#define OR_PREDICATE(__array__) [NSCompoundPredicate orPredicateWithSubpredicates:__array__]
#define SORT_DESCRIPTOR(__key__, __asc__)\
[NSSortDescriptor sortDescriptorWithKey:__key__ ascending:__asc__]

#define OPEN_SAFARI(__url__) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:__url__]]

#define STRING_EQUALITY(__str1__, __str2__) [__str1__ isEqualToString:__str2__]
#define IS_EMPTY_STRING(__str__) (!__str__ || [__str__ isEqualToString:@""])

#define IS_EMPTY_ARRAY(__arr__) (!__arr__ || [__arr__ count] == 0)