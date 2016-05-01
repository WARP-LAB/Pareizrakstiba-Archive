/*
 main.mm
 
 Pareizrakstība - Latviešu valodas pareizrakstības pārbaude
 Pareizrakstiba - Latvian spellcheck
 Copyright (C) 2008-2016 kroko / Reinis Adovics
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import <Foundation/Foundation.h>
#import "PareizrakstibaSpellServer.h"
#import "PareizrakstibaDelegate.h"

int main()
{
    NSAutoreleasePool *autoreleasepool= [[NSAutoreleasePool alloc] init];

	PareizrakstibaSpellServer *pareizrakstibaSpellServer = [[[PareizrakstibaSpellServer alloc] init] autorelease];
	PareizrakstibaDelegate *pareizrakstibaSpellServerDelegate = [[[PareizrakstibaDelegate alloc] init] autorelease];
	
	// We handle only one language so we store it in string
	// Otherwise our delegate could have mutable array having multiple languages
#if MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_4
	[pareizrakstibaSpellServerDelegate setLanguageHandled:@"Latvian"];
#else
	[pareizrakstibaSpellServerDelegate setLanguageHandled:@"lv"];
#endif
	
	NSLog(@"Pareizrakstiba 4.0 Copyright (C) 2008-2016 kroko / Reinis Adovics\n");
	
#ifdef DEBUG

	NSLog(@"Pareizrakstiba: handle language: %@\n", [pareizrakstibaSpellServerDelegate getLanguageHandled]);

#if __LP64__
	NSLog(@"Pareizrakstiba 64-bit\n");
#else
	NSLog(@"Pareizrakstiba 32-bit\n");
#endif

#if NS_BUILD_32_LIKE_64
	NSLog(@"Pareizrakstiba NS_BUILD_32_LIKE_64\n");
#endif

#endif

	if ([pareizrakstibaSpellServer registerLanguage:[pareizrakstibaSpellServerDelegate getLanguageHandled] byVendor:@"Apple"])
	{
		[pareizrakstibaSpellServer setDelegate:pareizrakstibaSpellServerDelegate];
		[pareizrakstibaSpellServer run];
		fprintf(stderr, "Pareizrakstiba: Unexpected death of Pareizrakstiba!\n");
	} else {
		fprintf(stderr, "Pareizrakstiba: NSSpellServer unable to register Latvian language.\n");
	}
	NSLog(@"Pareizrakstiba quitting.\n");
	[autoreleasepool release];
	return 0;
}