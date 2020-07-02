# THIS IS ARCHIVED REPO

**[See updated Pareizrakstiba here](https://github.com/WARP-LAB/Pareizrakstiba)**

# Pareizrakstība

Mac OSX service that adds support for system wide spellchecking in Latvian language.

This is for OS X 10.7+. Source of the old releases for 10.4-10.6, PPC, UB, Intel, 36&64 bit are not and will not be posted here. All the old binaries and installers however are still available at the project site for download, thus you're not lost if still using some old PPC beast.

## Requirements

* Mac OS 10.7.+ Intel 32 & 64-bit
* Beta release

## Installation

* If you want to set up this Latvian spellcheck then a change in system preferences is
	required due to the new sandboxing and certification model.  
	Under System Preferences : Security & Privacy : General change settings of Allow applications downloaded from to Anywhere.  
	Default for OS X 10.7 is Anywhere  
	Default for OS X 10.8 is Mac App Store and identified developers  
* Install using Uzstādīt Pareizrakstību.pkg
* Run Iespējot Pareizrakstību (Enable Pareizrakstība) and restart the computer. (optional)
* On first time when using spellcheck (in whatever application) OS might throw a dialog asking if you are willing to run Pareizrakstiba for the first time. Accept.
* If Latvian spellcheck does not show after the restart repeat the enabling process.
* The installation sets up Latvian spellcheck for the whole system, however each user account needs to enable it separately.

* Use Izdzēst Pareizrakstību to remove the spellcheck from the system.

* Pareizrakstība cannot utilise the functionality introduced in Mac OS 10.6, where
	choosing Automatic by Language in spelling panel enables checking for multiple
	languages at once. Functions such as Smart Quotes, Smart
	Dashes, Smart Links, Data Detectors are also disabled. This decision has been
	made based on the fact that OSX API has a bug.

## Notes

* Make sure that in applications Latvian spellcheck is selected
	Edit : Spelling and Grammar : Show Spelling and Grammar : Latvian
* NeoOffice & OpenOffice.org users have no need to install dictionaries from
	File : Wizards : Install New Dictionaries, for the mentioned applications
	use OSX system wide spellcheck. Besides, when using Pareizrakstība in the
	applications and adding new words, they will apply to the whole OS.
*  Learned words are kept in ~/Library/Spelling/

## Additional information

* Pareizrakstība removes all previous versions.
* Pareizrakstība completely removes CheckSpell.
* Pareizrakstība completely removes cocoAspell.

## Version history

#### 4.0

* 2018-01-19
* A version for Mac OS X 10.13 (64-bit) created.
* Language dictionary and affix tables updated to latest stable 1.3.0 (2016-09-16).
* Beta as it is not code signed.

#### 3.2

* 2015-07-02
* A version for Mac OS X 10.10+ (64-bit) created.
* Built w/ deployment target 10.9, so it should work also from 10.9.
* However v3.1 is still suggested for OS X 10.7 to 10.9.
* Language dictionary and affix tables updated to latest stable 1.1.0. (2015-05-21).
* Hunspell updated to latest stable 1.3.3. (2014-06-02).
* Beta as it is not code signed.

#### 3.1

* 2013-05-03
* A version for Mac OS X 10.7+ (32 & 64-bit) created.
* Language dictionary and affix tables updated to latest stable 0.9.6. (2013-04-15).
* Hunspell updated to latest stable 1.3.2. (2011-02-16).
* Beta as it is not certified and code signed.
* 
#### 3.01

* 2010-05-16
* Solved issue where Pareizraktība crashes if user checks text that contains characters that cannot be losslessly converted to ISO8859-13 character set.

#### 3.0

* 2010-04-19
* A version for Mac OS 10.6 (32 & 64-bit) created.
* Rewrite for OS 10.4 and 10.5.
* Language dictionary and affix tables updated to latest stable 0.9.1. (2010-04-22).
* Hunspell updated to latest stable 1.2.9. (2010-03-03).
* Enabled autocomplete. Possible word completions can be called by pressing ESC key.
* Various enhancements in the code.
* Releasing a preference pane System Preferences : Pareizrakstība that gives user ability to set various options for spellchecking has been postponed.

#### 2.1

* 2008-05-10
* Solved issue with Mac OS 10.4.

#### 2.0

* 2008-05-10
* Solved issue with iWork '08.
* Pareizrakstība now registers without vendor name.

#### 1.1

* 2008-04-01
* First public version.
* Finished documentation.

#### 1.0

* 2008-03-31
* Test version.
* Corrections made for Latvian affix table 0.7.3:
	- Affix and dictionary files are converted to UTF-8.
	- Some changes in aff (TRY UTF-8).
	- Removed all unnecessary information.

## License

See Licenses directory.
