/*
 PareizrakstibaDelegate.h
 
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

#import <Foundation/NSSpellServer.h>
#import "PareizrakstibaSpellWorker.h"

/*
 As I had the idea of introducing some basic grammar checking, made this a forwarding class to Worker so I could split tasks between different workers.
 Seperate class for spelling, rather than putting code right here into instance methods.
 So grammar could be easily "modally" added later.
 */

@protocol NSSpellServerDelegate; // Force preprocess NSSpellServerDelegate protocol before PareizrakstibaDelegate interface
@class	PareizrakstibaSpellWorker; // Spelling checker class

// Until 10.6 NSSpellServerDelegate is informal protocol
@interface PareizrakstibaDelegate : NSObject <NSSpellServerDelegate> {
    PareizrakstibaSpellWorker *mySC;
}
// construct/deconstruct
- (id)init;
- (void) dealloc;

////////////////////////////////////
// IMPLEMENTED

// Check Spelling in Strings, manage guesses and completions
- (NSRange)spellServer:(NSSpellServer *)sender findMisspelledWordInString:(NSString *)stringToCheck language:(NSString *)language wordCount:(NSInteger *)wordCount countOnly:(BOOL)countOnly;
- (NSArray *)spellServer:(NSSpellServer *)sender suggestGuessesForWord:(NSString *)word inLanguage:(NSString *)language;
- (NSArray *)spellServer:(NSSpellServer *)sender suggestCompletionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language;

// Managing the Spelling Dictionary
- (void)spellServer:(NSSpellServer *)sender didLearnWord:(NSString *)word inLanguage:(NSString *)language;
- (void)spellServer:(NSSpellServer *)sender didForgetWord:(NSString *)word inLanguage:(NSString *)language;

#if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_7
- (void)spellServer:(NSSpellServer *)sender recordResponse:(NSUInteger)response toCorrection:(NSString *)correction forWord:(NSString *)word language:(NSString *)language;
#endif

////////////////////////////////////
// NOT IMPLEMENTED

// Gives the delegate the opportunity to analyze both the spelling and grammar simultaneously, which is more efficient.
// Available in OS X v10.6 and later
//- (NSArray *)spellServer:(NSSpellServer *)sender checkString:(NSString *)stringToCheck offset:(NSUInteger)offset types:(NSTextCheckingTypes)checkingTypes options:(NSDictionary *)options orthography:(NSOrthography *)orthography wordCount:(NSInteger *)wordCount;

// Gives the delegate the opportunity to customize the grammatical analysis of a given string.
// Available in OS X v10.5 and later.
//- (NSRange)spellServer:(NSSpellServer *)sender checkGrammarInString:(NSString *)string language:(NSString *)language details:(NSArray **)outDetails;



@end
