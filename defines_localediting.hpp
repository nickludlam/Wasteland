// Global defines for local client/server testing mode. Copied in place by install.bat

// Logs out more info via diag_log, changes mission spawn times, adds god mode etc.
#define __DEBUG__

// Controls whether iniDB is used to persist player data
#define __DISABLE_INIDB__

// Define this if you want to enable long periods of running to drain your water level
#define __RUNNING_FATIGUE__

// FATIGUE SYSTEM DEFINES
#ifdef __RUNNING_FATIGUE__
#define FATIGUE_EXHAUSTED -3
#define FATIGUE_TIRED -2
#define FATIGUE_RESTING -1
#endif
