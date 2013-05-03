/*
 PareizrakstibaSpellChecker.h
 
 Pareizrakstība - Latviešu valodas pareizrakstības pārbaude
 Pareizrakstiba - Latvian spellcheck
 Copyright (C) 2008-2013 kroko / Reinis Adovics
 
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
#import <Foundation/NSSpellServer.h>
#import <CoreFoundation/CoreFoundation.h>
#import "hunspell.hxx" // import Hunspell

#if MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_4
// NSInteger/NSUInteger and Max/Mins (for 10.4 we care only about 32-bit arch here)
#ifndef NSINTEGER_DEFINED
typedef int NSInteger;
typedef unsigned int NSUInteger;
#define NSIntegerMax    INT_MAX
#define NSIntegerMin    INT_MIN
#define NSUIntegerMax   UINT_MAX
#define NSINTEGER_DEFINED 1
#endif  // NSINTEGER_DEFINED
#endif  // MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_4

class	Hunspell;

@interface PareizrakstibaSpellChecker : NSObject {
	Hunspell* myHS;
    NSMutableCharacterSet *wordCharSet;
}
- (id)init;
- (void) dealloc;
- (NSRange)spellServer:(NSSpellServer *)sender findMisspelledWordInString:(NSString *)stringToCheck language:(NSString *)language wordCount:(NSInteger *)wordCount countOnly:(BOOL)countOnly;
- (NSArray *)spellServer:(NSSpellServer *)sender suggestGuessesForWord:(NSString *)word inLanguage:(NSString *)language;
- (NSArray *)spellServer:(NSSpellServer *)sender suggestCompletionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language;
- (void)spellServer:(NSSpellServer *)sender recordResponse:(NSUInteger)response toCorrection:(NSString *)correction forWord:(NSString *)word language:(NSString *)language;
- (void)spellServer:(NSSpellServer *)sender didLearnWord:(NSString *)word inLanguage:(NSString *)language;
- (void)spellServer:(NSSpellServer *)sender didForgetWord:(NSString *)word inLanguage:(NSString *)language;


@end
