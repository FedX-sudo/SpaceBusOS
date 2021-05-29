TITLE: SpaceBusOS 

PLAN: 
	Create a mobile operating system using Linux technologies based on PostMarketOS, which has integrations with other open source technologies such as Mycroft, Home Assistant and Matrix. 

RATIONAL: 
	IOS and Android have had unparalleled dominance in the Mobile operating system world. I have experience with both, and both have low and high level technological issues that the manufacturers are not addressing. 

	The standout technical issues of IOS are:

		==> Deep integration with Apple analytics and tracking
		==> There is no system-wide ability to disable Bluetooth, Wi-Fi, camera, or 
microphones. 
		==> Apple refuses to address the numerous bugs of IOS such as simple phone 
capabilities like the text message notification not received bug of IOS14

		==> Outside jail breaking (which is nearly impossible) or side loading (which is 
basically useless) you are forced to use the Apple App Store which has the following issues for both developers and consumers:
			- All purchases must go through the Apple Pay system and Apple takes a 
a 30% tax.
			- No app is allowed to start a sub-process meaning it is difficult to natively 
compile code, and browsers don't have the privacy or security they normally would.
			- If Apple has developed a software alternative to an industry standard, 
all developers must use it, this includes, UIKit, AppKit, WatchKit, App Extensions, WebKit, and more. 
			- Any app can be removed from the app store for any reason, such as 
ProtonVPN being removed for promoting their ability to rout around national firewalls. 

	The standout technological issues of Android are: 

	==> Deep integration with Google Analytics and tracking (which is far worse than 
Apple's implementation). 
	==> numerous bugs in the OS, and probably more than IOS, with little to no 
development around solving them. 
	==> There more security holes in Android than Swiss cheese, and there is little to no 
development around fixing them. 
	==> Android has nowhere near an easy to use, standardized development platform the 
way IOS does make it more difficult to make an application on Android. 
	==> While it is technically open source, much of the core functionality of the OS is 
closed and can only be unlocked by allowing Google Analytics. 

There are alternatives such as Sailfish OS, Ubuntu Touch, and PostMarketOS, but these have their own technological issues making them nonviable replacements, which include:

	==> There is absolutely no standardized development platform
	==> The hardware support is very lacking
	==> They don't have support for many applications. 
	==> They don't have advanced features many people enjoy in IOS or Android such as 
a voice assistant, or smart home integration. 
	==> They are not user friendly. 

Therefore, I set out with the goal to create a free and open source mobile operating system based on PostMarketOS, to attempt to solve some of, if not all of, the above issues. 

Goal 1: 
	To create a user-friendly mobile operating system based on PostMarketOS. 

	PROCEDURE: Use the Linux OS PostMarketOS as a starting point to pull in and 
develop packages, scripts and tools to make a user-friendly, powerful, and open 
operating system. This would use the system package manager apk (alpine package manager) for system packages and scripts, while packaging the userland GUI applications in appimages. 

	RISK AND SAFETY: There is little to no risk, as this includes slight changes to existing 
projects and curating packages for the OS to function properly. 

	DATA ANALYSIS: n/a 

Goal 2: 
	Create a front end for Mycroft AI which integrates into the OS 


	PROCEDURE: Prepackage the Mycroft AI into SpaceBusOS, and pull in a frontend for 
user interaction, most likely using a KDE Plasma Applet, but will look into other options 
and integrations. By including Mycroft, this will also allow for highly accurate speech to text, and live phone call transcribing over an AI running locally on the device which optimizes for privacy, speed and security. 

	RISK AND SAFETY: There is little to no risk, as all this includes is pulling in existing 
packages, developing scripts for easy setup, and developing a GUI frontend for Mycroft. 

	DATA ANALYSIS: n/a







Goal 3: 
	Create a communication system which combines traditional SMS and voice 
communications with the Matrix protocol. 

	PROCEDURE: Use a Matrix bot script running in the background of the OS in userland 
to bridge SMS messages and phone calls into the Matrix protocol, allowing for cross 
platform sync, visual voicemail, and optimized privacy and security. 

	RISK AND SAFETY: There is little to no risk as all this includes is development of a 
matrixbot to bridge the phone call protocol, sms, and mms with the matrix protocol, 
along with a GUI frontend. 
	
	DATA ANALYSIS: n/a 

BIBLIOGRAPHY: 

“Android Issue Tracker.” Google Accounts, Google, issuetracker.google.com/issues?q=componentid%3A190923%2B&amp;pli=1. 

Broadcasting, Jupiter. “Keyboard Kurious.” Coder Radio, coder.show/415. 
Dove, Jackie. “The Most Common IOS 14 Problems and How to Fix Them.” 

Digital Trends, Digital Trends, 25 Mar. 2021, www.digitaltrends.com/mobile/common-ios-14-problems-and-how-to-fix-them/. 

Inc., Apple. “App Store Review Guidelines.” App Store Review Guidelines - Apple Developer, developer.apple.com/app-store/review/guidelines/#third-party-software. 

Kingsley-Hughes, Adrian. “IOS 14: The Worst Release to Date.” ZDNet, ZDNet, 1 Oct. 2020, www.zdnet.com/article/ios-14-the-worst-release-to-date/.

“Main Page.” PostmarketOS, wiki.postmarketos.org/wiki/Main_Page. 

“r/PostmarketOS - What Is the Package Manager of the PostmarketOS ?” Reddit, www.reddit.com/r/postmarketOS/comments/90ljwy/what_is_the_package_manager_of_the_postmarketos/. 

