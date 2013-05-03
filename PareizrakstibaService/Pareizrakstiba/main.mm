#import <Foundation/Foundation.h>
#import <Foundation/NSSpellServer.h>
#import "PareizrakstibaSpellServer.h"
#import "PareizrakstibaDelegate.h"

int main()
{
	NSAutoreleasePool *autoreleasepool= [[NSAutoreleasePool alloc] init];
	NSLog(@"Pareizrakstiba 3.1 (c) 2008-2013 kroko\n");
	// New spell server instance (used with higher versions, as spell server is the place to put our notification center in)
	PareizrakstibaSpellServer *pareizrakstibaSpellServer = [[PareizrakstibaSpellServer alloc] init];
	if ([pareizrakstibaSpellServer registerLanguage:@"lv" byVendor:@"Apple"])
	{
		[pareizrakstibaSpellServer setDelegate:[[[PareizrakstibaDelegate alloc] init] autorelease]];
		[pareizrakstibaSpellServer run];
		fprintf(stderr, "Unexpected death of Pareizrakstiba!\n");
	} else {
		fprintf(stderr, "NSSpellServer unable to register Latvian language.\n");
	}
	[autoreleasepool release];
	return 0;
}