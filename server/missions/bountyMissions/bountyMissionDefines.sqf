//	@file Version: 1.0
//	@file Name: moneyMissionController.sqf
//	@file Author: His_Shadow
//	@file Created: 07/09/2013 15:19

#include "defines.hpp"

#ifdef __DEBUG__

	#define bountyMissionTimeout 1800
	#define bountyMissionDelayTime 0

#else

	#define bountyMissionTimeout 1800
	#define bountyMissionDelayTime 1800

#endif

#define missionRadiusTrigger 50
#define bountyMissionColor "#0054fe"
#define failMissionColor "#FF1717"
#define successMissionColor "#17FF41"
#define subTextColor "#FFFFFF"
