#import "SVGKSourceString.h"

@implementation SVGKSourceString

@synthesize rawString = _rawString;
- (void)setRawString:(NSString *)rawString
{
	if (rawString != _rawString) {
		[_rawString release];
		_rawString = [[NSString alloc] initWithString:rawString];
	}
}

+ (SVGKSource*)sourceFromContentsOfString:(NSString*)rawString {
	SVGKSourceString *s = nil;
	@autoreleasepool {
		NSInputStream* stream = [NSInputStream inputStreamWithData:[rawString dataUsingEncoding:NSUTF8StringEncoding]];
		[stream open];
		
		s = [[SVGKSourceString alloc] initWithInputSteam:stream];
		s.rawString = rawString;
	}
	return [s autorelease];
}

- (void)dealloc {
	self.rawString = nil;
	[super dealloc];
}
@end
