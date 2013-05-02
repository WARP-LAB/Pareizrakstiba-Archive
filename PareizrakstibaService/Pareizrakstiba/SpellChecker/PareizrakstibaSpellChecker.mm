//
//  PareizrakstibaSpellChecker.m
//  Pareizrakstiba
//
//  Created by Reinis Adovičs on 02.05.13.
//  Copyright (c) 2013. g. kroko. All rights reserved.
//

#import "PareizrakstibaSpellChecker.h"

@implementation PareizrakstibaSpellChecker

- (id)init
{
    self = [super init] ;
	if (self != nil) {
		myHS = new Hunspell ([[ [ NSBundle bundleForClass:[self class] ] pathForResource:@"lv_LV_utf8" ofType:@"aff" inDirectory:@"lv_LV"] UTF8String],
							 [[ [ NSBundle bundleForClass:[self class] ] pathForResource:@"lv_LV_utf8" ofType:@"dic" inDirectory:@"lv_LV"] UTF8String]);
	}
    return self;
}

- (void) dealloc
{
	delete myHS;
	myHS = NULL;
    [super dealloc];
}

// Search for a misspelled word in a given string
- (NSRange)spellServer:(NSSpellServer *)sender findMisspelledWordInString:(NSString *)stringToCheck language:(NSString *)language wordCount:(NSInteger *)wordCount countOnly:(BOOL)countOnly
{
	
	NSScanner *stringToCheckScanner = [NSScanner scannerWithString:stringToCheck]; // create NSScanner object to scan stringToCheck
	// Charset for words (alphanumerical and .)
	//NSMutableCharacterSet *wordCharSet = [NSMutableCharacterSet alphanumericCharacterSet]; // set allowed charsets for words - letters and numbers (the common bug, thus next line)
#if MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_4
	NSMutableCharacterSet *wordCharSet = [[[NSCharacterSet alphanumericCharacterSet] mutableCopy] autorelease];
#else
	NSMutableCharacterSet *wordCharSet = [NSMutableCharacterSet alphanumericCharacterSet];
#endif
	[wordCharSet addCharactersInString:@"."];
	
	// If the method only counts the words in the string object and does not spell checking
	if (countOnly)
	{
		if (*wordCount) *wordCount = [[stringToCheck componentsSeparatedByString:@" "] count]; // get number of words in stringToCheck
	}
	else { // if countOnly==NO, then we check spelling
		NSInteger wordCountUntill = 0;
		while (![stringToCheckScanner isAtEnd]) // while scanner is not at end
		{
			[stringToCheckScanner scanUpToCharactersFromSet:wordCharSet intoString:nil]; // scans the string until a character from wordCharSet character set is encountered, send accumulating characters into nil
			if (![stringToCheckScanner isAtEnd]) // if scanner at this point is not at end (or characters from the set to be skipped remaining != TRUE), we have found a word
			{
				NSString *wordToCheck; //create string object for word
				[stringToCheckScanner scanCharactersFromSet:wordCharSet intoString:&wordToCheck];	// scan the stringToCheck as long as characters from wordCharSet are encountered
				// and accumulate characters into wordToCheck
				// if word is in dictionary or or word is in user dictionary
				//if ((myHS -> spell ([wordToCheck cStringUsingEncoding:(NSStringEncoding)[self hunspellDictEncodingToNSEncoding:myHS->get_dic_encoding()]])) || ([sender isWordInUserDictionaries:wordToCheck caseSensitive:YES]))
				//ENCODE
				if ((myHS -> spell ([wordToCheck UTF8String])) || ([sender isWordInUserDictionaries:wordToCheck caseSensitive:YES]))
				{
					wordCountUntill++;
					continue;
				}
				else
				{
					if (*wordCount) *wordCount = wordCountUntill; // pass number of words till misspelled word
					if ([wordToCheck length]>0 && ([wordToCheck characterAtIndex:[wordToCheck length]-1] == '.')) {
						return NSMakeRange ([stringToCheckScanner scanLocation] - [wordToCheck length], [wordToCheck length]-1);
					}
					else
					{
						return NSMakeRange ([stringToCheckScanner scanLocation] - [wordToCheck length], [wordToCheck length]);
					}
				}
			}
		}
		if (*wordCount) *wordCount = wordCountUntill; // pass number of words till misspelled word
	}
#if MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_4
	return NSMakeRange (NSNotFound, 0); // if our scanner failed to return range, then simply return {0x7fffffff,0} range
#else
	// In OS 10.5 and up NSNotFound is defined as NSIntegerMax (prior it was 0x7fffffff). So basically dependent whether we're running 32 or 64 bit environment.
	// Thus- compiling Pareizrakstība as 64-bit, will give NSNotFound==LONG_MAX, however apps utilising OSX spell server CAN expect
	// INT_MAX. Therefore a warning is rised
	// Pareizrakstiba[xxxx] Warning - conversion from 64 bit to 32 bit integral value requested within NSPortCoder, but the 64 bit value 9223372036854775807 cannot be represented by a 32 bit value
	// So just return INT_MAX in 64 bit case (or maybe 0x7fffffff ? )
#if __LP64__ || NS_BUILD_32_LIKE_64
	return NSMakeRange (INT_MAX, 0);
#else
	return NSMakeRange (NSNotFound, 0);
#endif
#endif  // MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_4
}


// Suggest guesses for the correct spelling of the given misspelled word
- (NSArray *)spellServer:(NSSpellServer *)sender suggestGuessesForWord:(NSString *)word inLanguage:(NSString *)language
{
	NSMutableArray *guessesForWord = [NSMutableArray array]; // create a dynamic array
	char ** hsSuggestList = 0;
	//NSLog(@"Trying to get suggestions for string: %s", [word UTF8String]);
	//ENCODE
	NSInteger hsSuggestListCount = myHS -> suggest (&hsSuggestList, [word UTF8String]); // returns number of suggestions and write them into hsSuggestList array
	//NSInteger hsSuggestListCount = myHS -> suggest (&hsSuggestList, [word cStringUsingEncoding:(NSStringEncoding)[self hunspellDictEncodingToNSEncoding:myHS->get_dic_encoding()]]); // returns number of suggestions and write them into hsSuggestList array
	for (NSInteger i = 0; i < hsSuggestListCount; i++) { // for all suggestions
		//ENCODE
		[guessesForWord addObject:[NSString stringWithUTF8String:hsSuggestList[i]]]; // add suggestion to suggestions array from sugList array
		//[guessesForWord addObject:[NSString stringWithCString: hsSuggestList[i] encoding:(NSStringEncoding)[self hunspellDictEncodingToNSEncoding:myHS->get_dic_encoding()]]];
	}
	if(hsSuggestList) myHS->free_list(&hsSuggestList, hsSuggestListCount); // clean suggest list
	return guessesForWord; // return our array
}

// Possible word completions, based on a partially completed string
- (NSArray *)spellServer:(NSSpellServer *)sender suggestCompletionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language
{
	// I will use array that's returned by suggestGuessesForWord. However it is a suggestion list for the right spelling of the current partialy completed world,
	// not a suggstion for competion! There's a difference!
	// return [self spellServer:sender suggestGuessesForWord:string inLanguage:language]; // reuse suggestGuessesForWord which returns an array of words
	
	// Get the partial range
	NSString *rangeString = [NSString stringWithString:[string substringWithRange:range]];
	
	
	// Therefore we will make string comparisons, to remove those words from suggestGuessesForWord returned array, which don't appear to be completions
	NSMutableArray *completionsList = [NSMutableArray arrayWithArray:[self spellServer:sender suggestGuessesForWord:rangeString inLanguage:language]];
	// make or completionsList to hold all suggestGuessesForWord array values
	for(NSUInteger i=0;i<[completionsList count];i++) { //check all completionsList array
		// if a word in completionsList at position i does not start with the same characters (and also that the characters are ordered the same)
		// as the current inString, then this isn't going to be a completion, thus remove it from the array
		
		if (![[completionsList objectAtIndex:i] hasPrefix:rangeString]) [completionsList removeObjectAtIndex:i]; // this method works
		// but accordingly to apple docs this should be faster (quote: "can speed some operations dramatically")
		/*
         if ([[completionsList objectAtIndex:i] compare:string options:(NSLiteralSearch) range:NSMakeRange(0,[string length])] != NSOrderedSame)
         [completionsList removeObjectAtIndex:i];
		 */
	}
	return completionsList;
}

- (void)spellServer:(NSSpellServer *)sender recordResponse:(NSUInteger)response toCorrection:(NSString *)correction forWord:(NSString *)word language:(NSString *)language {
    /*
     When the user accepts, rejects, or edits an autocorrection, the view notifies the NSSpellChecker class of what happened 
     in the client application, and NSSpellChecker then invokes this method, so that it can record that and modify future autocorrection 
     behavior based on what it has learned from the user's actions.
     
     /dev/null this one
     */
}


// User has added the specified word to the user’s list of acceptable words in the specified language.
- (void)spellServer:(NSSpellServer *)sender didLearnWord:(NSString *)word inLanguage:(NSString *)language
{
    /*
	When user chooses to "Learn Spelling" for a word OSX automatically adds it to user dictionary, located at ~/Library/Spelling/<langid>
	It works and word isn't spelled any more.
	Thus we need no code here
	
	When user chooses to "Ignore Spelling" no word is added to user dictionary, the word is kept in "memory" and
	only while document (NSTextField) containing the word is loaded.
	
	NSLog(@"User learned word \"%@\" in language %@.\n", word, language);
	
	Note: I see no need to use Hunspell method of adding word to the run-time dictionary.
	myHS->add([word UTF8String]);
     */
}

// User has removed the specified word from the user’s list of acceptable words in the specified language
- (void)spellServer:(NSSpellServer *)sender didForgetWord:(NSString *)word inLanguage:(NSString *)language
{
    /*
	When user chooses to "Unlearn Spelling" for a word OSX does it, using the same user dictionary, located at ~/Library/Spelling/<languageid>
	The way it's done, is adding the word one more time to the dic.
	It works and word isn't spelled any more.
	
	However, as user dictionary at ~/Library/Spelling/<languageid> will be used to contribute/submit new words to HunSpell aff&dic developer,
	there's a problem to solve. In the situation described above user would contribute word list with an incorrect word repeated twice, instead of not sending it at all!
	We have to change this OSX behavior, and on "Unlearn Spelling" actually delete the word from user dic.
	
	This methods description is incorrect - it's not "didForgetWord", burt "WILL!ForgetWord".
    "Notifies the delegate that the sender has removed the specified word from the user’s list of acceptable words in the specified language."
	but should be read as
	"Notifies the delegate that the sender IS GOING TO REMOVE the specified word from the user’s list of acceptable words in the specified language."
	Thus I cannot delete a word, that hasn't been written to user's dic yet.
	
	That means that on contribute process the code will have to check for any duplicate words (which accordingly are unlearned (incorrect) words).
	
	NSLog(@"User unlearned word \"%@\" in language %@.\n", word, language);
	
	Note: I see no need to use Hunspell method of removing word from the run-time dictionary.
	myHS->remove([word UTF8String]);
     */
}




@end
