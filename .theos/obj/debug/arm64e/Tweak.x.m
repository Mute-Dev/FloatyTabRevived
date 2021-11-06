#line 1 "Tweak.x"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UITabBar; 
static void (*_logos_orig$_ungrouped$UITabBar$setFrame$)(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$UITabBar$setFrame$(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL, CGRect); 

#line 1 "Tweak.x"


static void _logos_method$_ungrouped$UITabBar$setFrame$(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect frame) {

  self.layer.cornerCurve = kCACornerCurveContinuous;
  self.layer.cornerRadius = 25;
  self.layer.masksToBounds = true;
  frame = CGRectMake(25, 825, 370, frame.size.height);

_logos_orig$_ungrouped$UITabBar$setFrame$(self, _cmd, frame);

}



static __attribute__((constructor)) void _logosLocalCtor_5abf691f(int __unused argc, char __unused **argv, char __unused **envp) {

    NSString *processName = [NSProcessInfo processInfo].processName;
    BOOL isSpringboard = [@"SpringBoard" isEqualToString:processName];

    bool shouldLoad = NO;
    NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
    NSUInteger count = args.count;

    if(count != 0) {

        NSString *executablePath = args[0];

        if(executablePath) {

            NSString *processName = [executablePath lastPathComponent];
            BOOL isApplication = [executablePath rangeOfString:@"/Application/"].location != NSNotFound || [executablePath rangeOfString:@"/Applications/"].location != NSNotFound;
            BOOL isFileProvider = [[processName lowercaseString] rangeOfString:@"fileprovider"].location != NSNotFound;
            BOOL skip = [processName isEqualToString:@"AdSheet"]
                        || [processName isEqualToString:@"CoreAuthUI"]
                        || [processName isEqualToString:@"InCallService"]
                        || [processName isEqualToString:@"MessagesNotificationViewService"]
                        || [executablePath rangeOfString:@".appex/"].location != NSNotFound;

        if((!isFileProvider && isApplication && !skip) || isSpringboard) shouldLoad = YES;

        }

    }

    if(!shouldLoad) return;

    {Class _logos_class$_ungrouped$UITabBar = objc_getClass("UITabBar"); { MSHookMessageEx(_logos_class$_ungrouped$UITabBar, @selector(setFrame:), (IMP)&_logos_method$_ungrouped$UITabBar$setFrame$, (IMP*)&_logos_orig$_ungrouped$UITabBar$setFrame$);}}

}
