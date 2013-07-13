// Global defines for local client/server testing mode. Copied in place by install.bat

// Logs out more info via diag_log, changes mission spawn times, adds god mode etc.
#define __DEBUG__

// Controls whether iniDB is used to persist player data
#define __DISABLE_INIDB__

// Define this if you want to enable long periods of running to drain your water level
#define __RUNNING_EXHAUSTION__

// FATIGUE SYSTEM DEFINES
#ifdef __RUNNING_EXHAUSTION__
#define FATIGUE_EXHAUSTED -3
#define FATIGUE_TIRED -2
#define FATIGUE_RESTING -1
#endif

// If you want the "copy position" player menu option (for making waypoints!)
#define __PLAYER_MENU_COPY_POSITION__ 1

// Randomize
#define __MONEY_VAR_NAME__ "12345playermoney"
#define __MONEYBAG_VAR_NAME__ "ABCDEFbagmoney"
