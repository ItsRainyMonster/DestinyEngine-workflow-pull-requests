workspace "DestinyEngine"
    configurations { "Debug", "Release" }
    architecture "x86_64"
    targetdir "bin/%{prj.name}/%{cfg.system}-%{cfg.buildcfg}"
    objdir "bin-int/%{prj.name}/%{cfg.system}-%{cfg.buildcfg}"

    --filter "system:not windows"
        --premake.error("Destiny only supports Windows!")

-- Projects --
include "DestinyEngine"
include "Sandbox"