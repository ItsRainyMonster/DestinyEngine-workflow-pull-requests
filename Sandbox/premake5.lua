project "Sandbox"
    language "C++"
    cppdialect "C++latest"

    files {
        "src/**.cpp",
        "src/**.hpp"
    }

    links {
        "DestinyEngine"
    }

    filter "configurations:Debug"
        kind "ConsoleApp"
        defines { "DT_DEBUG" }
        symbols "On"

    filter "configurations:Release"
        kind "WindowedApp"
        defines { "DT_RELEASE" }
        optimize "On"

    filter "system:windows"
        defines { "DT_PLATFORM_WINDOWS" }