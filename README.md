# OffsetFinder
An sh script that finds offsets for you from an IPSW link :)
This can also generate offsets for betas.
<img src="https://i.ibb.co/TvNkVTn/Pasted-Graphic.png">
## Dependencies
Required :
- [libpatchfinder](https://github.com/tihmstar/libpatchfinder) from [tihmstar](https://github.com/tihmstar) installed but *Make* have to be configured with this command : 
```./configure --with-offsetexporter```
- [partialZipBrowser](https://github.com/tihmstar/partialZipBrowser) installed to PATH (a.k.a pzb)
- [Python 3](https://formulae.brew.sh/formula/python@3.11) and [PyIMG4](https://github.com/m1stadev/PyIMG4) installed (```brew install python && pip3 install pyimg4```)
- An IPSW (iOS 16.0 or higher) URL (it can be obtained from [ipsw.me](https://ipsw.me/) or [ipswbeta.dev](https://ipswbeta.dev/))
Optional : 
- Your Device Identifier (full list [here](http://bit.ly/Devices_IDs))
- The iOS version and the iOS Build ID that the IPSW contains
- An Internet Connection

## Credits
[AppInstallerIOS](https://github.com/BenjaminHornbeck6) - [Base Script](https://www.reddit.com/r/jailbreak/comments/15b0u0b/comment/jtqbzj1/)

[tihmstar](https://github.com/tihmstar) - [libpatchfinder](https://github.com/tihmstar/libpatchfinder)
