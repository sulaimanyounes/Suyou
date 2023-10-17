workspace "Suyou"
	architecture "x86_64"

	configurations 
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Suyou/vendor/GLFW/include"

include "Suyou/vendor/GLFW"

project "Suyou"
	location "Suyou"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "sypch.h"
	pchsource "Suyou/src/sypch.cpp"

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs 
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links 
	{ 
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

	defines 
	{
		"SY_PLATFORM_WINDOWS",
		"SY_BUILD_DLL"
	}

	postbuildcommands 
	{
		("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/sandbox")
	}

	filter "configurations:Debug"
		defines "SY_DEBUG"
		symbols "On"
		
	filter "configurations:Release"
		defines "SY_RELEASE"
		optimize "On"

		
	filter "configurations:Dist"
		defines "SY_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs 
	{
		"Suyou/vendor/spdlog/include",
		"Suyou/src"
	}

	links 
	{
		"Suyou"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

	defines 
	{
		"SY_PLATFORM_WINDOWS"
	}

	filter "configurations:Debug"
		defines "SY_DEBUG"
		symbols "On"
		
	filter "configurations:Release"
		defines "SY_RELEASE"
		optimize "On"

		
	filter "configurations:Dist"
		defines "SY_DIST"
		optimize "On"

