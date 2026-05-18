-- KEYS.LUA
--
-- Raw key number constants
-- Copied from SRB2's source code

rawset(_G, "KEY_NULL", 0) -- null key, triggers nothing
rawset(_G, "KEY_BACKSPACE", 8)
rawset(_G, "KEY_TAB", 9)
rawset(_G, "KEY_ENTER", 13)
rawset(_G, "KEY_ESCAPE", 27)
rawset(_G, "KEY_SPACE", 32)
rawset(_G, "KEY_MINUS", 45)
rawset(_G, "KEY_EQUALS", 61)

rawset(_G, "KEY_NUMLOCK", 197)
rawset(_G, "KEY_SCROLLLOCK", 198)

-- scancodes 71-83 (non-extended)
rawset(_G, "KEY_KEYPAD7", 199)
rawset(_G, "KEY_KEYPAD8", 200)
rawset(_G, "KEY_KEYPAD9", 201)
rawset(_G, "KEY_MINUSPAD", 202)
rawset(_G, "KEY_KEYPAD4", 203)
rawset(_G, "KEY_KEYPAD5", 204)
rawset(_G, "KEY_KEYPAD6", 205)
rawset(_G, "KEY_PLUSPAD", 206)
rawset(_G, "KEY_KEYPAD1", 207)
rawset(_G, "KEY_KEYPAD2", 208)
rawset(_G, "KEY_KEYPAD3", 209)
rawset(_G, "KEY_KEYPAD0", 210)
rawset(_G, "KEY_KPADDEL", 211)

-- windows95 keys
rawset(_G, "KEY_LEFTWIN", 219)
rawset(_G, "KEY_RIGHTWIN", 220)
rawset(_G, "KEY_MENU", 221)

-- scancodes 71-83 EXTENDED are remapped to these by the keyboard handler (just add 30)
rawset(_G, "KEY_KPADSLASH", 228) -- extended scancode 53 '/' remapped
rawset(_G, "KEY_HOME", 229)
rawset(_G, "KEY_UPARROW", 230)
rawset(_G, "KEY_PGUP", 231)
rawset(_G, "KEY_LEFTARROW", 233)
rawset(_G, "KEY_RIGHTARROW", 235)
rawset(_G, "KEY_END", 237)
rawset(_G, "KEY_DOWNARROW", 238)
rawset(_G, "KEY_PGDN", 239)
rawset(_G, "KEY_INS", 240)
rawset(_G, "KEY_DEL", 241)

rawset(_G, "KEY_F1", 187)
rawset(_G, "KEY_F2", 188)
rawset(_G, "KEY_F3", 189)
rawset(_G, "KEY_F4", 190)
rawset(_G, "KEY_F5", 191)
rawset(_G, "KEY_F6", 192)
rawset(_G, "KEY_F7", 193)
rawset(_G, "KEY_F8", 194)
rawset(_G, "KEY_F9", 195)
rawset(_G, "KEY_F10", 196)
rawset(_G, "KEY_F11", 215)
rawset(_G, "KEY_F12", 216)

rawset(_G, "KEY_PAUSE", 255)

-- these ones must be non-extended scancodes (rctrl, rshift, lalt)
rawset(_G, "KEY_LSHIFT", 182)
rawset(_G, "KEY_RSHIFT", 183)
rawset(_G, "KEY_LCTRL", 157)
rawset(_G, "KEY_RCTRL", 158)
rawset(_G, "KEY_LALT", 184)
rawset(_G, "KEY_RALT", 185)

rawset(_G, "KEY_CAPSLOCK", 186)
rawset(_G, "KEY_CONSOLE", 96)

rawset(_G, "KEY_MOUSE1", 256)
rawset(_G, "KEY_JOY1", 264)
rawset(_G, "KEY_HAT1", 296)

rawset(_G, "KEY_DBLMOUSE1", 312)
rawset(_G, "KEY_DBLJOY1", 320)
rawset(_G, "KEY_DBLHAT1", 352)

rawset(_G, "KEY_2MOUSE1", 368)
rawset(_G, "KEY_2JOY1", 376)
rawset(_G, "KEY_2HAT1", 408)

rawset(_G, "KEY_DBL2MOUSE1", 424)
rawset(_G, "KEY_DBL2JOY1", 432)
rawset(_G, "KEY_DBL2HAT1", 464)

rawset(_G, "KEY_MOUSEWHEELUP", 480)
rawset(_G, "KEY_MOUSEWHEELDOWN", 481)
rawset(_G, "KEY_2MOUSEWHEELUP", 482)
rawset(_G, "KEY_2MOUSEWHEELDOWN", 483)

rawset(_G, "NUMINPUTS", 484)
