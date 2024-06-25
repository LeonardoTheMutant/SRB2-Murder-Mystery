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

And now when we kindly ask to print the Delta character (Δ, `0xC4` in hex, `\192` in decimal) MM will try to load the file by the name of `"1253C192"` and draw this graphic on the screen. Wow, it works now! Amazing isn't it?
<br><br>
In theory, you can create your character encoding standard that no one will understand. The possibilities are endless.
<br><br>
But you may wonder now how to color this new text. Characters like `0x80` or `0x85` are now reserved for your character encoding. Technically SRB2 never uses characters from `0x00` to `0x0F` so we can probably use them as our new color codes. We can and <code>V_DrawStrASCII()</code> uses this range of characters as color codes. This is cool but there are also problems in making a new line in a string now: `\n` or "Carriage return" symbol is in this range and now is used as a color code. This is one of the cons of the MM string format.
<br><br>
Let's say you want to use this cool string format with colors but you don't want to rewrite your 50+ Kilobytes text to convert every color code manually. <code>V_ConvertStringColor()</code> exists just for this purpose - it converts SRB2 color codes in your string to MM format and as a return value it returns your modified string. You can do vise-versa with the <code>V_ConvertStringColor2()</code> function which converts MM color codes to vanilla SRB2 ones. Just remember to use MM strings with <code>V_DrawStrASCII()</code> and regular SRB2 strings with <code>v.drawString()</code> because they're not compatible with each other.
<br><br>

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

## Guess that's it

I hope that you have an understanding of the MM string format now. If you still don't understand it... well, it may be a problem with me trying to explain things like this... You can dig into the code anytime to understand things better or find something that is not documented here. This library will most likely be posted on the Message Board as an Open Asset in the future so everyone can have a look at it.

Happy coding!