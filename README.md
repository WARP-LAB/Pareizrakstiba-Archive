Pareizrakstība. Latvian spellcheck for OS X.
===


![Pareizrakstiba](Installer/Resources/images/IMG/Pareizrakstiba.png?raw=true "Pareizrakstiba")


Mac OS X & OS X service that adds support for system wide spellchecking in Latvian language.
Supported OS versions

* 10.4 32-bit PPC & 32-bit Intel (Universal binary)
* 10.5 32/64-bit PPC & 32/64-bit Intel (Universal binary)
* 10.6+ 32/64-bit Intel
* .. currently up to 10.11 included

*PPC support is kept. The PPC compatible versions should even [support G3](http://www.everymac.com/systems/by_capability/maximum-macos-supported.html) on 10.4.11. 10.4 version is tuned for G3, 10.5. version is tuned for G4. G5 supported in both cases and 10.5 should run in 64 bit mode.*

---

###Building

Use Xcode 3.1.4 on OS X 10.5 Leopard for building 10.4 32bit Universal binary and 10.5-10.6 32/64bit Universal binary targets. *Note: One cannot use Xcode 3.2.3 on OS X 10.6 Snow Leopard for 10.4, 10.5, 10.6, because it is incapable of building PPC (thus UB).* Deploy the binary that is built against 10.5 SDK in 10.6.

```
build-10.4_10.5-to-10.6-debug.shbuild-10.4_10.5-to-10.6-release.sh
```

Use Xcode 7.3+ for building and signing 10.7+ 32/64bit Intel target.

```build-10.7+-debug.shbuild-10.7+-release.sh
```

The above strategy was chosen by jiggling needs for UB, which Xcode has which SDKs, GCC vs LLVM, changes in OS API, Gatekeeper that was introduced in 10.7.5 and the stupid idea that we will probably spend money on signing the package starting v4+, a.o.

Notes *(os version :: latest release :: newest Xcode on the platform that has good backwards SDK coverage)*

* Mac OS X Tiger :: 10.4.11 / November 14, 2007 :: Xcode 2.5
* Mac OS X Leopard (last one supporting Power PC)  :: 10.5.8 (Build 9L31a) / August 13, 2009 :: Xcode 3.1.4
* Mac OS X Snow Leopard (last one, that can run Universal linaries (select Intel part from it) :: 10.6.8 v1.1 (Build 10K549) / July 25, 2011 :: Xcode 3.2.6
* Mac OS X Lion :: 10.7.5 (Build 11G63) / October 4, 2012 :: Xcode 4.3.3 (Xcode 4.6.3 includes 10.8 SDK, but drops 10.6)
* OS X Mountain Lion :: 10.8.5 (Build 12F45) / October 3, 2013 :: Xcode 5.0.2
* OS X Mavericks :: 10.9.5 (Build 13F1712) / March 21, 2016 :: Xcode 6.2 & command line tools
* OS X Yosemite :: 10.10.5 (Build 14F27) / August 13, 2015 :: Xcode 7.2.1 & command line tools
* OS X El Capitan :: Current OS :: Xcode 7.3+ & command line tools

*Test rig uses two Macs that have all OSes (10.4.-10.7 on MacBookPro2,2 & 10.8-10.11 on Macmini6,2) as debugging messy OS X services really requires that. Not so much SpellServer itself (which has multiple bugs that has been deicovered through years & reported to Apple to no avail), more the installation packages pre&postflights, how [pbs](x-man-page://pbs) misbehaves, as we try to deploy user friendly packages.*


__Configuring Hunspell__

This varies based on LLVM/GCC on your system.

On recent OSes using LLVM
```
CC=llvm-gcc-4.2 CPP=llvm-cpp-4.2 CXX=llvm-g++-4.2 ./configure
```

On older OSses using GCC
```
CC=gcc-4.2 CPP=cpp-4.2 CXX=g++-4.2 ./configure
```

---

###Version history

* dev-4.0
    * 30.04.2016.
    * Release will be signed using WARP ca$h. Pareizrakstiba is downloaded over 20k times, 6 or so people have said thanks. You're welcome.
    * Revised building system for all supported versions.
    * Separate builds for 10.4, 10.5-10.6, 10.7+
    * Using Latvian affix table v.1.2.0. (24.01.2016.).
    * Using Hunspell 1.3.3. (02.06.2014.). Hunspell has moved to Github and bumped it's version as well as added new release. But the issue count is worrying, so we're playing safe.

* 3.2
    * 02.07.2015.
    * A version for Mac OS X 10.10+ (64-bit) created.
    * Built w/ deployment target 10.9, so it should work also from 10.9.
    * However v3.1 is still suggested for OS X 10.7 to 10.9.
    * Beta as it is not certified and code signed.
    * Using Latvian affix table v.1.1.0. (21.05.2015.).
    * Using Hunspell 1.3.3. (02.06.2014.).

* 3.1
    * 03.05.2013.
    * A version for Mac OS X 10.7+ (32 & 64-bit) created.
    * Beta as it is not certified and code signed.
    * Using Latvian affix table v.0.9.6. (15.04.2013.).
    * Using Hunspell 1.3.2. (16.02.2011.).

* 3.01
    * 16.05.2010.
    * Solved problem where Pareizraktība crashes if user checks text that contains characters
that cannot be loslessly converted to ISO8859-13 character set.

* 3.0
    * 19.04.2010.
    * A version for Mac OS 10.6 (32 & 64-bit) created.
    * Rewrite for OS 10.4 and 10.5.
    * Using Latvian affix table v.0.9.1. (22.04.2010.).
    * Using Hunspell 1.2.9. (03.03.2010.).
    * Enabled autocomplete. Possible word completions can be called by pressing ESC key.
    * Various enhancements in the code.
    * Releasing a preference pane System Preferences : Pareizrakstība that gives user ability to set various options for spellchecking has been postponed.

* 2.1
    * 10.05.2008.
    * Solved issue with Mac OS 10.4.

* 2.0
    * 10.05.2008.
    * Solved issue with iWork '08.
    * Pareizrakstība now registers without vendor name.

* 1.1
    * 01.04.2008.
    * First public version.
    * Finished documentation.

* 1.0
    * 31.03.2008.
    * Test version.
    * Latviešu valodas pareizrakstības pārbaudes bibliotēka- v.0.7.3 2008-02-22 © Jānis Eisaks.
	
---


### Manual

Mac OSX service that adds support for systemwide spellchecking in Latvian language.

Requirements

Mac OS 10.4 Intel or PPC 32-bit
Mac OS 10.5 Intel or PPC 32/64-bit
Mac OS 10.6 Intel 32/64-bit
Mac OS 10.7+ Intel 32 & 64-bit

Installation

• If you want to set up this Latvian spellcheck then a change in system preferences is
	required due to the new sandboxing and certification model.
	Under System Preferences : Security & Privacy : General change settings of 
		Allow applications downloaded from to Anywhere.
	Default for OS X 10.7 is Anywhere
	Default for OS X 10.8 is Mac App Store and identified developers
• Install using Uzstādīt Pareizrakstību.pkg
• Run Iespējot Pareizrakstību (Enable Pareizrakstība) and restart the computer. (optional)
• On first time when using spellcheck (in whatever application) OS might throw a 
	dialog asking if you are willing to run Pareizrakstiba for the
	first time. Accept.
• If Latvian spellcheck does not show after the restart repeat the enabling process.
• The installation sets up Latvian spellcheck for the whole system, however each
	user account needs to enable it separately.

• Use Izdzēst Pareizrakstību to remove the spellcheck from the system.

• Pareizrakstība cannot utilise the functionality introduced in Mac OS 10.6, where
	choosing Automatic by Language in spelling panel enables checking for multiple
	languages at once. Functions such as Smart Quotes, Smart
	Dashes, Smart Links, Data Detectors are also disabled. This decision has been
	made based on the fact that OSX API has a bug.

Notes

• Make sure that in applications Latvian spellcheck is selected
	Edit : Spelling and Grammar : Show Spelling and Grammar : Latvian
• NeoOffice & OpenOffice.org users have no need to install dictionaries from
	File : Wizards : Install New Dictionaries, for the mentioned applications
	use OSX system wide spellcheck. Besides, when using Pareizrakstība in the
	applications and adding new words, they will apply to the whole OS.
• Learned words are kept in ~/Library/Spelling/

Additional information

• Pareizrakstība removes all previous versions.
• Pareizrakstība completely removes CheckSpell.
• Pareizrakstība completely removes cocoAspell.


	
```

/*
 * Pareizrakstība - Latviešu valodas pareizrakstības pārbaude
 * Pareizrakstiba - Latvian spellcheck
 * Copyright (C) 2008-2016 kroko / Reinis Adovičs
 * http://www.kroko.me code[AT]kroko.me
 * Licenesed as 
 * GPL - GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
 * http://www.gnu.org/licenses/gpl.html
 *
 * Using:
 * 1)
 * Latviešu valodas affix fails lietošanai ar OpenOffice, LibreOffice u.c.
 * Latvian affix table for OpenOffice, LibreOffice etc
 * Copyright (C) 2002-2014 Janis Eisaks, jancs@dv.lv
 * Licenesd as
 * LGPL- GNU LESSER GENERAL PUBLIC LICENSE Version 2.1, February 1999
 * 
 * 2)
 * Hunspell
 * Licenesd as
 * LGPL- GNU LESSER GENERAL PUBLIC LICENSE Version 2.1, February 1999 or later
 * or GPL- GNU GENERAL PUBLIC LICENSE Version 2 or later
 * or MPL- MOZILLA PUBLIC LICENSE Version 1.1
 *
 * The Initial Developers of the Original Code are
 * Kevin Hendricks (MySpell) and Laszlo Nemeth (Hunspell).
 * Portions created by the Initial Developers are Copyright (C) 2002-2005
 * the Initial Developers. All Rights Reserved.
 *
 * Contributor(s):
 * David Einstein 
 * Davide Prina
 * Giuseppe Modugno 
 * Gianluca Turconi
 * Simon Brouwer
 * Noll Janos
 * Biro Arpad
 * Goldman Eleonora
 * Sarlos Tamas
 * Bencsath Boldizsar
 * Halacsy Peter
 * Dvornik Laszlo
 * Gefferth Andras
 * Nagy Viktor
 * Varga Daniel
 * Chris Halls
 * Rene Engelhard
 * Bram Moolenaar
 * Dafydd Jones
 * Harri Pitkanen
 * Andras Timar
 * Tor Lillqvist
 *
 */

```

