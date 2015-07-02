/*
 PareizrakstibaDelegate.h
 
 Pareizrakstība - Latviešu valodas pareizrakstības pārbaude
 Pareizrakstiba - Latvian spellcheck
 Copyright (C) 2008-2015 kroko / Reinis Adovics
 
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
#import "PareizrakstibaSpellChecker.h"

/*
 As I had the idea of introducing some basic grammar checking, made this a forwarding class.
 Seperate class for spelling, rather than putting code right here into instance methods.
 So grammar could be easily "modally" added later.
 */

@class	PareizrakstibaSpellChecker; // Spelling checker class

// Since 10.6 this is informal protocol
@interface PareizrakstibaDelegate : NSObject <NSSpellServerDelegate> {
    PareizrakstibaSpellChecker*		mySC;
}
// construct/deconstruct
- (id)init;
- (void) dealloc;

////////////////////////////////////
// IMPLEMENTED

// Check Spelling in Strings
- (NSRange)spellServer:(NSSpellServer *)sender findMisspelledWordInString:(NSString *)stringToCheck language:(NSString *)language wordCount:(NSInteger *)wordCount countOnly:(BOOL)countOnly;
- (NSArray *)spellServer:(NSSpellServer *)sender suggestGuessesForWord:(NSString *)word inLanguage:(NSString *)language;

// Managing the Spelling Dictionary
- (NSArray *)spellServer:(NSSpellServer *)sender suggestCompletionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language;
- (void)spellServer:(NSSpellServer *)sender recordResponse:(NSUInteger)response toCorrection:(NSString *)correction forWord:(NSString *)word language:(NSString *)language; // Required since 10.7!
- (void)spellServer:(NSSpellServer *)sender didLearnWord:(NSString *)word inLanguage:(NSString *)language;
- (void)spellServer:(NSSpellServer *)sender didForgetWord:(NSString *)word inLanguage:(NSString *)language;


////////////////////////////////////
// NOT IMPLEMENTED

// Check grammar in strings
// - (NSArray *)spellServer:(NSSpellServer *)sender checkString:(NSString *)stringToCheck offset:(NSUInteger)offset types:(NSTextCheckingTypes)checkingTypes options:(NSDictionary *)options orthography:(NSOrthography *)orthography wordCount:(NSInteger *)wordCount;
//- (NSRange)spellServer:(NSSpellServer *)sender checkGrammarInString:(NSString *)string language:(NSString *)language details:(NSArray **)outDetails;



@end
