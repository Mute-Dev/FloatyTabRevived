%hook UITabBar

- (void)setFrame:(CGRect)frame {

    self.layer.cornerCurve = kCACornerCurveContinuous;
    self.layer.cornerRadius = 25;
    self.layer.masksToBounds = true;
    frame = CGRectMake(25, 825, 370, frame.size.height); // here u would want to do CGRectMake(self.frame.origin.x+whatever) and then repeat that, that will make it work on all devices right now it only works on urs
    %orig(frame); // this puts in a different argument, the one that you want
    // another way of doing this is self.frame = frame

}

%end

%ctor {

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

    %init;

}
