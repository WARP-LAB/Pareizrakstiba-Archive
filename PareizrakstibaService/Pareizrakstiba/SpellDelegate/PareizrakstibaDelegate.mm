//
//  PareizrakstibaDelegate.m
//  Pareizrakstiba
//
//  Created by Reinis Adovičs on 02.05.13.
//  Copyright (c) 2013. g. kroko. All rights reserved.
//

#import "PareizrakstibaDelegate.h"

@implementation PareizrakstibaDelegate

- (id)init
{
	self = [super init];
    if (self) {
		mySC = [[PareizrakstibaSpellChecker alloc] init];
	}
    return self;
}

- (void) dealloc
{
	[mySC release];
    [super dealloc];
}

// Search for a misspelled word in a given string
- (NSRange)spellServer:(NSSpellServer *)sender findMisspelledWordInString:(NSString *)stringToCheck language:(NSString *)language wordCount:(NSInteger *)wordCount countOnly:(BOOL)countOnly
{
	return [mySC spellServer:sender findMisspelledWordInString:stringToCheck language:language wordCount:wordCount countOnly:countOnly];
}

// Suggest guesses for the correct spelling of the given misspelled word
- (NSArray *)spellServer:(NSSpellServer *)sender suggestGuessesForWord:(NSString *)word inLanguage:(NSString *)language
{
	return [mySC spellServer:sender suggestGuessesForWord:word inLanguage:language];
}

// Possible word completions, based on a partially completed string
- (NSArray *)spellServer:(NSSpellServer *)sender suggestCompletionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language
{
	return [mySC spellServer:sender suggestCompletionsForPartialWordRange:range inString:string language:language];
}

// Notifies the spell checker of the users’s response to a correction. (required)
- (void)spellServer:(NSSpellServer *)sender recordResponse:(NSUInteger)response toCorrection:(NSString *)correction forWord:(NSString *)word language:(NSString *)language
{
    return [mySC spellServer:sender recordResponse:response toCorrection:correction forWord:word language:language];
}

// User has added the specified word to the user’s list of acceptable words in the specified language.
- (void)spellServer:(NSSpellServer *)sender didLearnWord:(NSString *)word inLanguage:(NSString *)language
{
	return [mySC spellServer:sender didLearnWord:word inLanguage:language];
}

// User has removed the specified word from the user’s list of acceptable words in the specified language
- (void)spellServer:(NSSpellServer *)sender didForgetWord:(NSString *)word inLanguage:(NSString *)language
{
	return [mySC spellServer:sender didForgetWord:word inLanguage:language];
}




@end
