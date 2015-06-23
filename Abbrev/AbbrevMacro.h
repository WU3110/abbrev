//
//  AbbrevMacro.h
//  Abbrev
//

// fundamental
#define ab_string(...) [NSString stringWithFormat:__VA_ARGS__]
#define ab_is_null(__obj__) [__obj__ isEqual:[NSNull null]]
#define ab_is_greater_than \
return floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1;

//
// blocks
//
#define ab_weaken(__name__, __src__) __weak typeof(__src__) __name__ = __src__;

//
// view
//
#define ab_view_from_nib(__nib_name__) \
[[[NSBundle mainBundle] loadNibNamed:__nib_name__ owner:self \
                             options:nil] objectAtIndex:0]


//
// localize
//
#define ab_localized_string(__label__) NSLocalizedString(__label__, nil)

// singleton
#define ab_singleton_header(__class__) \
+(__class__*)sharedInstance;

#define ab_singleton_implement(__class__, __init__) \
static __class__ *sharedInstance = nil;\
+(__class__*)sharedInstance{static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{sharedInstance = [[__class__ alloc] init];});return sharedInstance;}\
+(id)allocWithZone:(NSZone *)zone{static dispatch_once_t onceToken;dispatch_once(&onceToken,\
^{sharedInstance = [super allocWithZone:zone];});return sharedInstance;}\
-(id)init{self = [super init];if(self){__init__;}return self;}\
-(id)copyWithZone:(NSZone *)zone{return self;}\


// Util
#define ab_screen_size [UIScreen mainScreen].bounds.size
#define ab_screen_width CGRectGetWidth([UIScreen mainScreen].bounds)
#define ab_screen_height CGRectGetHeight([[UIScreen mainScreen] bounds])
#define ab_screen_width_offset(__offset__) CGRectGetWidth([UIScreen mainScreen].bounds) - __offset__
#define ab_screen_height_offset(__offset__) CGRectGetHeight([[UIScreen mainScreen] bounds]) - __offset__

#define ab_class_name(__obj__) NSStringFromClass([__obj__ class])
#define ab_is_subclass_of_class(__obj__, __target__) [[__obj__ class] isSubclassOfClass:__target__];
#define ab_is_kind_of_class(__obj__, __target__) [[__obj__ class] isKindOfClass:__target__];
#define ab_is_null_or_obj(__obj__) [__obj__ isEqual:[NSNull null]] ? nil : __obj__

// http://flatuicolors.com/
#define ab_color_with_rgb(__r__, __g__, __b__) [UIColor colorWithR:__r__/255.f G:__g__/255.f B:__b__/255.f A:1.f];
#define ab_color_with_rgba(__r__, __g__, __b__, __a__) [UIColor colorWithR:__r__ G:__g__ B:__b__ A:__a__];

#define ab_mutable_set [NSMutableSet set]
#define ab_mutable_dict [NSMutableDictionary dictionary]
#define ab_mutable_string [NSMutableString string]
#define ab_mutable_array [NSMutableArray array]

#define ab_dict_from_plist_named(__file__) \
[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__file__ ofType:@"plist"]]
#define ab_array_from_plist_named(__file__) \
[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__file__ ofType:@"plist"]]


#define ab_predicate(...) [NSPredicate predicateWithFormat:__VA_ARGS__]
#define ab_and_predicate(__array__) [NSCompoundPredicate andPredicateWithSubpredicates:__array__]
#define ab_or_predicate(__array__) [NSCompoundPredicate orPredicateWithSubpredicates:__array__]
#define ab_sort_descriptor(__key__, __asc__)\
[NSSortDescriptor sortDescriptorWithKey:__key__ ascending:__asc__]

#define ab_open_safari(__url__) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:__url__]]

#define ab_is_empty_string(__str__) (!__str__ || [__str__ isEqualToString:@""])

#define ab_is_empty_array(__arr__) (!__arr__ || [__arr__ count] == 0)