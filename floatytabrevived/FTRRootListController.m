#import <Foundation/Foundation.h>
#import "FTRRootListController.h"

@implementation FTRRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@end
