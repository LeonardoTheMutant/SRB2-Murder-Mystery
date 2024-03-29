## Murder Mystery string format
### For Murder Mystery `10.0-BETA+`
---
Murder Mystery has its own custom string rendering library for HUD. It allows for strings with extended ASCII characters (0x80-0xFF) to be drawn on HUD. In vanilla SRB2 this range of characters is used by text coloring and transparency symbols.
<br><br>
Murder Mystery string uses this range of characters like symbols that can be printed on the screen (SRB2 executable has to be modified to use these in console/chat). Different character encodings are defining each of these characters differently. Murder Mystery (as for version `10.0-BETA`) supports languages like Russian and Ukrainian which are not Latin-based and their native letters are not supported by vanilla SRB2. To fix this problem MM uses ***Windows1251*** codepage as a base for these two languages.
<br><br>
Let's take this string for an example:<br>
<code>"\xD0\x9F\xD1\x80\xD0\xB8\xD0\xB2\xD1\x96\xD1\x82 \xD1\x81\xD0\xB2\xD1\x96\xD1\x82\xD0\xB5!"</code><br>
Standard HUD rendering functions in BLUA (Lua 5.1 in SRB2) will display this string as a mess because all of these characters marked by hexadecimal values are setting the color and the transparency of the text. If you take the ***Windows1251*** encoding as a base and try to read this string with it you will read this string like<br>
<code>"Привіт світе!"</code><br>
which means "Hello world!" in Ukrainian.
<br><br>
Now let's take a look at this string:<br>
<code>"Witaj \x9Cwiecie!"</code><br>
This is supposed to be a Polish text saying "Hello world!". ***Windows1251*** will not help here because it's designed for Cyrillic. Polish is a Latin-based language and like European languages, it has its symbols. Those symbols are found in the ***Windows1250*** codepage. If you read this string with that codepage now you will get<br>
<code>Witaj świecie!</code><br>
which looks readable now.
<br><br>
Of course, all of these examples will not work in vanilla SRB2 with regular HUD rendering functions. However, you can make your own string rendering function that CAN RENDER these strings and this is what MM did. Functions like <code>V_DrawStrASCII()</code> and <code>V_DrawStrASCIIcentered()</code> are designed to print strings with extended ASCII symbols. Still, this is not enough to actually print strings like these because you're missing the font for the characters. `SRB2.pk3` contains graphics for Standard ASCII characters only (0x19-0x7F to be specific). You need the graphics for **every single extended character** you are going to use. This may sound like a problem for you and it kinda is if you're not good at drawing. But let's imagine that you have the graphics. You type <code>V_DrawStrASCII()</code> into your code and when you launch it doesn't show anything or outputs `?` instead. The fourth argument of this function, which we call `lang` in the code, specifies the language to use as a character base. If you used `"EN"` as a parameter for this argument you will get `?` on each extended character. This happens because English in MM is hard-coded to use vanilla SRB2 standard console font (`STCFN` internally) and does not support extended ASCII characters. Language must be set to something else than `"EN"`. But custom languages have to contain the `"CHARSET"` data to use the extended ASCII font meant for them.<br><br>
Let's imagine that we're making a Greek translation for Murder Mystery. We use ***Windows1253*** as our base. We make the graphics for its letters and name them like `"1253C###"` (`###` is a decimal number that corresponds to a character in that codepage). Our prefix for Greek codepage is `"1253C"` because we named files like that. Now we need to tell MM to use these files as graphics for Greek letters. We go to our **Custom Language File** that we have already made for Greek. Now we need to include the `"CHARSET"` value to the LUA table to make the result look like this:

    local greekText={
        ["VERSION"]="10.0-BETA", --don't forget about the compatibility!
        ["AUTHOR"]="Sonic",
        ["NONASCII"]=true, --little outdated name but we set this to show that this language is not Latin-based
        ["CHARSET"]="1253C", --this is the font graphic file prefix that we needed!
        ["MM"]="Murder Mystery in Greek",
        ...
    }
    MM.AddLang("GR", greekText)

And now when we kindly ask to print the Delta character (Δ, `\0xC4` in hex, `\192` in decimal) MM will try to load the file by the name of `"1253C192"` and draw this graphic on the screen. Wow, it works now! Amazing isn't it?
<br><br>
In theory, you can create your character encoding standard that no one will understand. The possibilities are endless.
<br><br>
But you may wonder now how to color this new text. Characters like `\0x80` or `\0x85` are now reserved for your character encoding. Technically SRB2 never uses characters from `\0x00` to `\0x0F` so we can probably use them as our new color codes. We can and <code>V_DrawStrASCII()</code> uses this range of characters as color codes. This is cool but there are also problems in making a new line in a string now: `\n` or "Carriage return" symbol is in this range and now is used as a color code. This is one of the cons of the MM string format.
<br><br>
Let's say you want to use this cool string format with colors but you don't want to rewrite your 50+ Kilobytes text to convert every color code manually. <code>V_ConvertStringColor()</code> exists just for this purpose - it converts SRB2 color codes in your string to MM format and as a return value it returns your modified string. You can do vise-versa with the <code>V_ConvertStringColor2()</code> function which converts MM color codes to vanilla SRB2 ones. Just remember to use MM strings with <code>V_DrawStrASCII()</code> and regular SRB2 strings with <code>v.drawString()</code> because they're not compatible with each other.
<br><br>

### Guess that's it
I hope that you have an understanding of the MM string format now. If you still don't understand it... well, it may be a problem with me trying to explain things like this... You can dig into the code anytime to understand things better or find something that is not documented here. This library will most likely be posted on the Message Board as an Open Asset in the future so everyone can have a look at it.

Happy coding!