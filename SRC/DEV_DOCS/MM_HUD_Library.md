# Murder Mystery HUD library (version `1.0-ALPHA`)

## Extended ASCII string renderer

This library includes custom functions for string rendering. They allow to draw strings with characters ranged from 0x80 to 0xFF (128 - 255 in decimal)(also known as Extended ASCII characters) on HUD. In vanilla SRB2 this range of characters is used by text coloring and transparency symbols.
<br><br>
To explain the "Extended ASCII" thing we have to get deep into the long and boring details...
<br><br>
Let's take this LUA-formatted string for an example:<br>
<code>"\xD0\x9F\xD1\x80\xD0\xB8\xD0\xB2\xD1\x96\xD1\x82 \xD1\x81\xD0\xB2\xD1\x96\xD1\x82\xD0\xB5!"</code><br>
Standard HUD rendering functions in BLUA (this is what Lua 5.1 modification in SRB2 is officially called) will display this string as a mess because all of these characters marked by hexadecimal values are setting the color and the transparency of the text. If you take the ***Windows1251*** encoding as a base and try to manually decode this string you will get something like this:<br>
<code>"Привіт світе!"</code><br>
which means "Hello world!" in Ukrainian.
<br><br>
Let's take a look at this string now:<br>
<code>"Witaj \x9Cwiecie!"</code><br>
This is supposed to be a Polish text saying "Hello world!". ***Windows1251*** will not help here because it's designed for Cyrillic. Polish is a Latin-based language and like European languages, it has its own native symbols. Those symbols can be found in the ***Windows1250*** codepage. If you decode this string with that codepage you will now get<br>
<code>Witaj świecie!</code><br>
which looks readable now.
<br><br>
Now lets get into the "under the hood" details and how you can print such strings in SRB2 yourself with this library
<br><br>
Functions like <code>V_DrawStrASCII()</code> and <code>V_DrawStrASCIIcentered()</code> are designed to print strings with Extended ASCII symbols. Still, this is not enough to actually print strings like these because you're missing the font for the characters (more specifically, font graphics/patches). `SRB2.pk3` contains graphics for the printable Standard ASCII characters only (0x19-0x7E range, 25-126 in decimal). You need the graphics for **every single extended character** you are going to use.
<br><br>
Let's imagine that we are making a Greek translation of Murder Mystery. We use ***Windows1253*** as our base. We make the font graphics and name them like `"1253C###"` (`###` is a decimal number that corresponds to a character in that codepage). Our prefix for Greek codepage is `"1253C"` because we named files like that. Now we need to tell our Rendering Functions to use these files as graphics for Greek letters. The 4th argument in the <code>V_DrawStrASCII</code> function specifies the character set prefix to use. In case of the **Custom Language File** for Murder Mystery gametype we simply need to include the `"CHARSET"` key to the LUA table and set its value to the Character Set prefix we got. The final result should look something like this:

```lua
    local greekText={
        ["VERSION"]="1.0", --don't forget about the compatibility!
        ["AUTHOR"]="Sonic",
        ["NONASCII"]=true, --little outdated name but we set this to show that this language is not Latin-based
        ["CHARSET"]="1253C", --this is the font graphic file prefix that we needed!
        ["MM"]="Murder Mystery in Greek",
        ...
    }

    MM.AddLang("GR", greekText)
```

And now when we kindly ask the <code>V_DrawStrASCII()</code> function (or the gametype) to print the Delta character (Δ, `0xC4` in hex, 192 in decimal) the function will try to load the file by the name of `"1253C192"` and draw this graphic on the screen. Wow, it works now! Amazing isn't it?
<br><br>
In theory, you can create your character encoding standard that no one will understand. The possibilities are endless.
<br><br>
Things get a little bit comlicated when it comes to the text coloring since characters like `0x80` or `0x85` are now reserved for your character encoding. <code>V_DrawStrASCII()</code>, like <code>v.draw()</code>, supports 16 text colors, but as color codes it uses characters ranged from `0x10` to `0x1F`. Note that **translucency is not supported in MM Strings** (there are no free character ranges left to implement this). This is one of the cons of the MM String Renderers.
<br><br>
Let's say you want to use this cool string format with colors but you don't want to rewrite your 50+ Kilobytes of text to convert every color code manually. <code>V_ConvertStringColor()</code> exists just for this purpose - it converts SRB2 color codes in your string to MM format and as a return value it returns your modified string. You can do vise-versa with the <code>V_ConvertStringColor2()</code> function which converts MM color codes to vanilla SRB2 ones. Just remember to use MM strings with <code>V_DrawStrASCII()</code> and regular SRB2 strings with <code>v.drawString()</code> because they're not compatible with each other.
<br><br>

## Text Color codes
List of Text Color codes for <code>V_DrawStrASCII()</code> function. Very similar to the [vanilla SRB2 color codes](http://wiki.srb2.org/wiki/Lua#Special_characters)

| Decimal |  Hexadecimal | Color | Example |
| --- | --- | --- | --- | 
| \16 | \x10 | White/Reset | ![White](http://wiki.srb2.org/w/images/f/f7/Sampletext-none.png) |
| \17 | \x11 | Magenta[1] | ![Magenta](http://wiki.srb2.org/w/images/3/3f/Sampletext-magenta.png) |
| \18 | \x12 | Yellow | ![Yellow](http://wiki.srb2.org/w/images/5/52/Sampletext-yellow.png) |
| \19 | \x13 | Green | ![Green](http://wiki.srb2.org/w/images/f/fe/Sampletext-green.png) |
| \20 | \x14 | Blue | ![Blue](http://wiki.srb2.org/w/images/d/db/Sampletext-blue.png) |
| \21 | \x15 | Red | ![Red](http://wiki.srb2.org/w/images/d/d7/Sampletext-red.png) |
| \22 | \x16 | Gray | ![Gray](http://wiki.srb2.org/w/images/f/fd/Sampletext-gray.png) |
| \23 | \x17 | Orange | ![Orange](http://wiki.srb2.org/w/images/f/fa/Sampletext-orange.png) |
| \24 | \x18 | Cyan | ![Cyan](http://wiki.srb2.org/w/images/0/0a/Sampletext-sky.png) |
| \25 | \x19 | Purple | ![Purple](http://wiki.srb2.org/w/images/8/88/Sampletext-purple.png) |
| \26 | \x1A | Aqua | ![Aqua](http://wiki.srb2.org/w/images/7/7a/Sampletext-aqua.png) |
| \27 | \x1B | Peridot | ![Peridot](http://wiki.srb2.org/w/images/f/fd/Sampletext-peridot.png) |
| \28 | \x1C | Azure | ![Azure](http://wiki.srb2.org/w/images/6/6b/Sampletext-azure.png) |
| \29 | \x1D | Brown | ![Brown](http://wiki.srb2.org/w/images/f/f1/Sampletext-brown.png) |
| \30 | \x1E | Pink | ![Pink](http://wiki.srb2.org/w/images/b/bc/Sampletext-rosy.png) |
| \31 | \x1F | Black/Inverted | ![Black](http://wiki.srb2.org/w/images/f/f6/Sampletext-inverted.png) |

[1]: The text renderer in the `MMHELP` in-game command does not interpret this code corrently and does not color the text

## Extended ASCII Character Sets

List of Extended ASCII tables and the available characters which are included in MM. You can also see the characters directly in the game by using the `MMCHARSET [charset_prefix]` console command (available only in developer builds)

### Windows1250 (1250C)

Based on [Windows1250](https://wikipedia.org/wiki/Windows-1250) codepage.
Central and Eastern European Latin-based languages such as Polish, Czech, Slovak, Hungarian, German

<table>
    <tr>
        <th></th><th>0</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th><th>F</th>
    </tr>
    <tr>
        <th>8</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>Š</td><td></td><td>Ś</td><td>Ť</td><td>Ž</td><td>Ź</td>
    </tr>
    <tr>
        <th>9</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>š</td><td></td><td>ś</td><td>ť</td><td>ž</td><td>ź</td>
    </tr>
    <tr>
        <th>A</th><td></td><td></td><td></td><td>Ł</td><td></td><td>Ą</td><td></td><td></td><td></td><td></td><td>Ş</td><td></td><td></td><td></td><td></td><td>Ż</td>
    </tr>
    <tr>
        <th>B</th><td></td><td></td><td></td><td>ł</td><td></td><td></td><td></td><td></td><td></td><td>ą</td><td>ş</td><td></td><td>Ľ</td><td></td><td>ľ</td><td>ż</td>
    </tr>
    <tr>
        <th>C</th><td>Ŕ</td><td></th><td></th><td></th><td>Ä</th><td></th><td>Ć</td><td>Ç</td><td>Č</td><td>É</td><td>Ę</td><td>Ë</td><td>Ě</td><td>Í</td><td>Î</td><td>Ď</td>
    </tr>
    <tr>
        <th>D</th><td></td><td>Ń</td><td>Ň</td><td>Ó</td><td>Ô</td><td>Ő</td><td>Ö</td><td></td><td>Ř</td><td></td><td>Ú</td><td>Ű</td><td>Ü</td><td>Ý</td><td></td><td>ß</td>
    </tr>
    <tr>
        <th>E</th><td>ŕ</td><td>á</td><td>â</td><td>ă</td><td>ä</td><td></td><td>ć</td><td>ç</td><td>č</td><td>é</td><td>ę</td><td>ë</td><td>ě</td><td>í</td><td>î</td><td>ď</td>
    </tr>
    <tr>
        <th>F</th><td></td><td>ń</td><td>ň</td><td>ó</td><td>ô</td><td>ő</td><td>ö</td><td></td><td>ř</td><td></td><td>ú</td><td>ű</td><td>ü</td><td>ý</td><td></td><td></td>
    </tr>
</table>

<hr>

### Windows1251 (1251C)

Based on [Windows1251](https://wikipedia.org/wiki/Windows-1251) codepage.
Cyrillic languages such as Russian, Ukrainian, Belarussian, Bulgarian, Macedonian

<table>
    <tr>
        <th></th><th>0</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th><th>F</th>
    </tr>
    <tr>
        <th>8</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>9</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>A</th><td></td><td></td><td></td><td></td><td></td><td>Ґ</td><td></td><td></td><td>Ё</td><td></td><td>Є</td><td></td><td></td><td></td><td></td><td>Ї</td>
    </tr>
    <tr>
        <th>B</th><td></td><td></td><td>І</td><td>і</td><td>ґ</td><td></td><td></td><td></td><td>ё</td><td></td><td>є</td><td></td><td></td><td></td><td></td><td>ї</td>
    </tr>
    <tr>
        <th>C</th><td>А</td><td>Б</th><td>В</th><td>Г</th><td>Д</th><td>Е</th><td>Ж</td><td>З</td><td>И</td><td>Й</td><td>К</td><td>Л</td><td>М</td><td>Н</td><td>О</td><td>П</td>
    </tr>
    <tr>
        <th>D</th><td>Р</td><td>С</td><td>Т</td><td>У</td><td>Ф</td><td>Х</td><td>Ц</td><td>Ч</td><td>Ш</td><td>Щ</td><td>Ъ</td><td>Ы</td><td>Ь</td><td>Э</td><td>Ю</td><td>Я</td>
    </tr>
    <tr>
        <th>E</th><td>а</td><td>б</td><td>в</td><td>г</td><td>д</td><td>е</td><td>ж</td><td>з</td><td>и</td><td>й</td><td>к</td><td>л</td><td>м</td><td>н</td><td>о</td><td>п</td>
    </tr>
    <tr>
        <th>F</th><td>р</td><td>с</td><td>т</td><td>у</td><td>ф</td><td>х</td><td>ц</td><td>ч</td><td>ш</td><td>щ</td><td>ъ</td><td>ы</td><td>ь</td><td>э</td><td>ю</td><td>я</td>
    </tr>
</table>

<hr>

### Windows1253 (1253C)

Based on [Windows1253](https://wikipedia.org/wiki/Windows-1253) codepage.
Greek alphabet

<table>
    <tr>
        <th></th><th>0</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th><th>F</th>
    </tr>
    <tr>
        <th>8</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>9</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>A</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>B</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>C</th><td>ΐ</td><td>Α</th><td>Β</th><td>Γ</th><td>Δ</th><td>Ε</th><td>Ζ</td><td>Η</td><td>Θ</td><td>Ι</td><td>Κ</td><td>Λ</td><td>Μ</td><td>Ν</td><td>Ξ</td><td>Ο</td>
    </tr>
    <tr>
        <th>D</th><td>Π</td><td>Ρ</td><td></td><td>Σ</td><td>Τ</td><td>Υ</td><td>Φ</td><td>Χ</td><td>Ψ</td><td>Ω</td><td>Ϊ</td><td>Ϋ</td><td>ά</td><td>έ</td><td>ή</td><td>ί</td>
    </tr>
    <tr>
        <th>E</th><td>ΰ</td><td>α</td><td>β</td><td>γ</td><td>δ</td><td>ε</td><td>ζ</td><td>η</td><td>θ</td><td>ι</td><td>κ</td><td>λ</td><td>μ</td><td>ν</td><td>ξ</td><td>ο</td>
    </tr>
    <tr>
        <th>F</th><td>π</td><td>ρ</td><td>ς</td><td>σ</td><td>τ</td><td>υ</td><td>φ</td><td>χ</td><td>ψ</td><td>ω</td><td>ϊ</td><td>ϋ</td><td>ό</td><td>ύ</td><td>ώ</td><td></td>
    </tr>
</table>

<hr>

### Windows1254 (1254C)

Based on [Windows1254](https://wikipedia.org/wiki/Windows-1254) codepage.
Similar to [Windows1252](https://wikipedia.org/wiki/Windows-1252) but also supports Turkish letters

<table>
    <tr>
        <th></th><th>0</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th><th>9</th><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th><th>F</th>
    </tr>
    <tr>
        <th>8</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>Š</td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>9</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>š</td><td></td><td></td><td></td><td></td><td>Ÿ</td>
    </tr>
    <tr>
        <th>A</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>B</th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    <tr>
        <th>C</th><td>À</td><td>Á</th><td>Â</th><td>Ã</th><td>Ä</th><td></th><td></td><td>Ç</td><td>È</td><td>É</td><td>Ê</td><td>Ë</td><td>Ì</td><td>Í</td><td>Î</td><td>Ï</td>
    </tr>
    <tr>
        <th>D</th><td>Ğ</td><td>Ń</td><td>Ň</td><td>Ó</td><td>Ô</td><td>Ő</td><td>Ö</td><td></td><td></td><td>Ù</td><td>Ú</td><td>Û</td><td>Ü</td><td>İ</td><td>Ş</td><td>ß</td>
    </tr>
    <tr>
        <th>E</th><td>à</td><td>á</td><td>â</td><td>ã</td><td>ä</td><td></td><td></td><td>ç</td><td>è</td><td>é</td><td>ê</td><td>ë</td><td>ì</td><td>í</td><td>î</td><td>ï</td>
    </tr>
    <tr>
        <th>F</th><td>ğ</td><td>ñ</td><td>ò</td><td>ó</td><td>ô</td><td>ő</td><td>ö</td><td></td><td></td><td>ù</td><td>ú</td><td>û</td><td>ü</td><td>ı</td><td>ş</td><td>ÿ</td>
    </tr>
</table>

<hr>

## Text Patches

As an alternative to the regular Patch files, MM HUD Library provides a way to draw bitmap graphics provided by the **Text**. This is developed primarily for the **Custom Language Files** as these will most likely not be packed in a `.pk3` archive (to additionally include all required graphics).
<br><br>
You must be very familliar how the `TIME` HUD label in vanilla SRB2 looks (if not you can open the game right now and see it)(this label can also be found in `srb2.pk3` as `STTTIME` lump). All you need to know about the Text Patch is that it is a bitmap representation of an image where every charater is a pointer to SRB2 palette's color. This is what `STTTIME` patch looks like as Text Patch:

```lua
local BMP_TIME_INFO = { --offset values
	xoff = 0, --X
	yoff = 0  --Y
}
local BMP_TIME = { --actuall Patch data
	"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
	"IIIIII\x1FFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
	"\xFFFFII\x1F1F\x1FFFII\x1FFF\xFFIII\xFFFF\xFFIII\x1FFFII\x1F1F\x1F1F\x1F",
	"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIII\xFFIIII\x1FFFII\x1F",
	"\xFFFFII\x1FFF\xFFFFII\x1FFF\xFFIIIIIIIII\x1FFFIIIII\x1F",
	"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FIII\x1FII\x1FFFIIIII\x1F",
	"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1F1FI\x1FFFII\x1FFFII\x1F1F\x1F1F",
	"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\x1FFF\xFFII\x1FFFII\x1F",
	"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
	"\xFFII\x1FFF\xFFFFII\x1FFF\xFFII\x1FFF\xFFFF\xFFII\x1FFFIIIIII\x1F",
	"\xFF1F\x1F1F\xFFFF\xFF1F\x1F1F\xFFFF\x1F1F\x1FFF\xFFFF\xFF1F\x1F1F\xFF1F\x1F1F\x1F1F\x1F1F"
}
```

*If you have eyes like Neo from the Matrix you can already see the image.* But don't worry if you don't because this is actually a simplified/optimized version of the Text Patch where some of the Hexadecimal values are converted into ASCII Characters (the `\x49` value here got converted into `I`) and Hexadecimal values are 16-bit (`\x1F` is 8-bit value, `\x1F1F` is 16-bit but is read as two characters). `\xFF` is a translucent pixel, `\x49` (or `I`) points to color Yellow in SRB2's palette, `\x1F` is color black.
<br><br>
Getting the height of such Patch is as simple as getting the length of the table where it is stored. To get the width you can use <code>V_TextPatchWidth(*string[]* textpatch)</code> function
```lua
print(#BMP_TIME) --height, prints 11
print(V_TextPatchWidth(BMP_TIME)) --width, prints 31
```
<br><br>
To make a color swap you will need to use the <code>V_TextPatch_SwapColor(*string[]* textpatch, *int* color1, *int* color2)</code> function. Last two arguments are specifying the source and the target colors (`color1` will be swapped with `color2`). The function returns a Text Patch with swapped color.

## Guess that's it

I hope that you have an understanding of the MM string format now. If you still don't understand it... well, it may be a problem with me trying to explain things like this... You can dig into the code anytime to understand things better or find something that is not documented here. This library will most likely be posted on the Message Board as an Open Asset in the future so everyone can have a look at it.

Happy coding!