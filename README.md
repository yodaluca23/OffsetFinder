# OffsetFinder
A sh script that finds offsets for you from an IPSW link :)
This can also generate offsets for betas.
<img src="https://i.ibb.co/RQJ9hDs/Pasted-Graphic.png">
## Dependencies
Required :
- [libpatchfinder](https://github.com/tihmstar/libpatchfinder) from [tihmstar](https://github.com/tihmstar) installed but MakeFile have to be configured with this command : 
```./configure --with-offsetexporter```
- [partialZipBrowser](https://github.com/tihmstar/partialZipBrowser) installed to PATH (aka pzb)
- [Python 3](https://formulae.brew.sh/formula/python@3.11) and [PyIMG4](https://github.com/m1stadev/PyIMG4) installed (```brew install python && pip3 install pyimg4```)
- An IPSW (iOS/iPadOS 16.0->16.6b1) URL (it can be obtained from [ipsw.me](https://ipsw.me/) or [ipswbeta.dev](https://ipswbeta.dev/))
- An Internet Connection

Optional : 
- Your Device Identifier (full list [here](http://bit.ly/Devices_IDs))
- The iOS version and the iOS Build ID that the IPSW contains


Note : This was only tested on macOS Sonoma ; you may not be able to run this script on Linux or older versions of macOS (like really old, Ventura, Monterey and Big Sur should run it fine)

## Offsets
I'm planning to add even more beta offsets in the upcomming days !
If you want to help me, try running the script and create a PR.

The offsets names are in this format `iDevice-Identifier iOS-Version iOS-Build-ID.h` e.g. `iPhone11,8 16.3 20D47.h`
## Credits
[AppInstallerIOS](https://github.com/BenjaminHornbeck6) - [Base Script](https://www.reddit.com/r/jailbreak/comments/15b0u0b/comment/jtqbzj1/)

[tihmstar](https://github.com/tihmstar) - [libpatchfinder](https://github.com/tihmstar/libpatchfinder)
