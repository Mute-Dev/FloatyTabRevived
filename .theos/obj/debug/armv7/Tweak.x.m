#line 1 "Tweak.x"
@interface UITabBarAppearance ()
@end


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
static void (*_logos_orig$_ungrouped$UITabBar$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UITabBar$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL); 

#line 4 "Tweak.x"

static void _logos_method$_ungrouped$UITabBar$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$_ungrouped$UITabBar$didMoveToWindow(self, _cmd);
    
  self.layer.cornerRadius = 5;
self.layer.masksToBounds = true;
self.frame = CGRectMake(0, 0, 200, 200);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UITabBar = objc_getClass("UITabBar"); { MSHookMessageEx(_logos_class$_ungrouped$UITabBar, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$UITabBar$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$UITabBar$didMoveToWindow);}} }
#line 13 "Tweak.x"
