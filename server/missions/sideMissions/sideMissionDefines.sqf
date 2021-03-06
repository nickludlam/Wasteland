//	@file Version: 1.0
//	@file Name: missionDefines.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 15:19

#include "defines.hpp"

#ifdef __DEBUG__

	#define sideMissionTimeout 230
	#define sideMissionDelayTime 60

#else

	#define sideMissionTimeout 1200
	#define sideMissionDelayTime 300

#endif

#define missionRadiusTrigger 50
#define sideMissionColor "#4BC9B0"
#define failMissionColor "#FF1717"
#define successMissionColor "#17FF41"
#define subTextColor "#FFFFFF"