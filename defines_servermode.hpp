// Global defines for standalone server mode. Copied in place by install.bat

// Uncomment this when testing in the standalone server
//#define __DEBUG__

// Define this if you want to enable long periods of running to drain your water level
#define __RUNNING_EXHAUSTION__

// FATIGUE SYSTEM DEFINES
#ifdef __RUNNING_EXHAUSTION__
#define FATIGUE_EXHAUSTED -3
#define FATIGUE_TIRED -2
#define FATIGUE_RESTING -1
#endif
