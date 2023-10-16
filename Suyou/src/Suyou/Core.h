#pragma once

#ifdef SY_PLATFORM_WINDOWS
	#ifdef SY_BUILD_DLL
		#define SUYOU_API __declspec(dllexport)
	#else
		#define SUYOU_API __declspec(dllimport)
	#endif // SY_BUILD_DLL
#else
	#error Suyou only supports Windows!
#endif // SY_PLATFORM_WINDOWS

#define BIT(x) (1 << x)

