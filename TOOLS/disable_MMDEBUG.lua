-- Disable the DEVELOPER BUILD flag in the MurderMystery add-on
--
-- If you compiled the add-on .PK3 from the GitHub repository your file
-- is marked as a DEVELOPER BUILD version by default
--
-- DEVELOPER BUILD enables some debug features such as MMPLAYER and MMNODES
-- console commands to manipulate and see player states respectively.
-- HUD also changes, it will display "Not for public hosting" message and
-- player debug info that often overlapps the regular content.
--
-- To disable the debug flag you can edit the /LUA/INIT.LUA file inside your
-- compiled .PK3 and change the "devbuild" variable to "nil"
-- (use CTRL-F if you can't find it in the code). This change will fully
-- disable all Debug Features and make your MM.PK3 as a release version.
--
-- As a quick-fix alternative you can add this .LUA alongise your loaded
-- MM.PK3 that is marked as a DEVELOPER BUILD to disable most of the Debug
-- features and make it like the release version. But, again, it won't fully
-- disable the flag because Debug Commands will still work and you will put
-- your server on risk if you are going to host such patched .PK3 publicly.
--
-- PLEASE DO NOT USE THIS FILE ON YOUR PUBLIC SERVER AS A PATCH AS IT WON'T
-- FULLY REMOVE THE DEBUG FLAG!
-- THIS SCRIPT IS MEANT FOR TESTING PURPOSES ONLY!
-- HOST DEDICATED RELEASE VERSIONS FROM "GITHUB RELEASES" INSTEAD

if (MurderMystery) and (MurderMystery.devbuild)
    MurderMystery.devbuild=nil
    print("\x83Succesfuly disabled the DEBUG FLAG in Murder Mystery")
else error("MurderMystery is not defined or release version is loaded") end
