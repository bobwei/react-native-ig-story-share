#import "IGStoryShare.h"
#import <React/RCTBridge.h>

@implementation IGStoryShare

RCT_EXPORT_MODULE(IGStoryShare)

RCT_EXPORT_METHOD(share:(NSString *)b64BackgroundImage) {
  NSURL *urlScheme = [NSURL URLWithString:@"instagram-stories://share?source_application=com.linkingwish.restory"];
  NSData *backgroundImage = [[NSData alloc] initWithBase64EncodedString:[NSString stringWithFormat:@"%@", b64BackgroundImage] options:0];
  NSArray *pasteboardItems = @[@{@"com.instagram.sharedSticker.backgroundImage" : backgroundImage}];
  NSDictionary *pasteboardOptions = @{UIPasteboardOptionExpirationDate : [[NSDate date] dateByAddingTimeInterval:60 * 5]};
  [[UIPasteboard generalPasteboard] setItems:pasteboardItems options:pasteboardOptions];
  dispatch_async( dispatch_get_main_queue(), ^{
    [[UIApplication sharedApplication] openURL:urlScheme options:@{} completionHandler:nil];
  });
}

@end
