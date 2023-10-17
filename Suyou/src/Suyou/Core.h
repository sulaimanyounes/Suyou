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

#ifdef SY_ENABLE_ASSERTS
#define SY_ASSERT(x, ...) { if(!(x)) { SY_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#define SY_CORE_ASSERT(x, ...) { if(!(x)) { SY_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
#define SY_ASSERT(x, ...)
#define SY_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

