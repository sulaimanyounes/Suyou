workspace "Suyou"
	architecture "x86_64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Suyou"
	location "Suyou"
	kind "SharedLib"
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
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.22000.0"

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

	links {
		"Suyou"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.22000.0"

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

