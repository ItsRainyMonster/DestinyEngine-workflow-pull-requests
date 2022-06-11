include "ShaderRules.lua"

project "DestinyEngine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++latest"

    files { 
        "src/**.cpp",
        "src/**.hpp"
    }

    filter "configurations:Debug"
        defines "DT_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "DT_RELEASE"
        optimize "On"

    filter "system:windows"
        links {
            "d3d11.lib",
            "Comctl32.lib"
        }
        defines "DT_PLATFORM_WINDOWS"
        rules { "HLSLShaders" }
        postbuildcommands {
            "{COPYDIR} assets %{cfg.buildtarget.directory}/assets"
        }