//	@file Version: 1.0
//	@file Name: missionDefines.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19

#include "defines.hpp"

#ifdef __DEBUG__

	#define mainMissionTimeout 300
	#define mainMissionDelayTime 5

#else

	#define mainMissionTimeout 1200
	#define mainMissionDelayTime 600

#endif

#define missionRadiusTrigger 50

#define mainMissionColor "#52bf90"
#define failMissionColor "#FF1717"
#define successMissionColor "#17FF41"
#define subTextColor "#FFFFFF"