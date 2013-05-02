//
//  PareizrakstibaSpellChecker.h
//  Pareizrakstiba
//
//  Created by Reinis Adovičs on 02.05.13.
//  Copyright (c) 2013. g. kroko. All rights reserved.
//

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
	Hunspell*						myHS;
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
