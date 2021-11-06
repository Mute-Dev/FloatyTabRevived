%hook UITabBar

- (void)setFrame:(CGRect)frame {

  self.layer.cornerCurve = kCACornerCurveContinuous;
  self.layer.cornerRadius = 25;
  self.layer.masksToBounds = true;
  frame = CGRectMake(25, 825, 370, frame.size.height);

%orig(frame);

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
