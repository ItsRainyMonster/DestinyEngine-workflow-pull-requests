rule "HLSLShaders"
    display "Compile HLSL shaders"
    fileextension ".glsl"

    buildmessage 'Compiling %(Filename).glsl'
    buildcommands {
        'vendor/shader-compiling/glslcc.exe "%(FullPath)" --output=assets/shaders/hlsl/%(Filename).hlsl --lang=hlsl --reflect',
        'vendor/shader-compiling/fxc.exe /nologo /Emain /Tvs_5_0 %{cfg.buildcfg:gsub("Debug","/Od"):gsub("Release","")} /Zi /Fo assets/shaders/hlsl/%(Filename)_vs.cso /Fd %{cfg.buildtarget.directory}/%(Filename)_vs.pdb assets/shaders/hlsl/%(Filename)_vs.hlsl',
        'vendor/shader-compiling/fxc.exe /nologo /Emain /Tps_5_0 %{cfg.buildcfg:gsub("Debug","/Od"):gsub("Release","")} /Zi /Fo assets/shaders/hlsl/%(Filename)_fs.cso /Fd %{cfg.buildtarget.directory}/%(Filename)_fs.pdb assets/shaders/hlsl/%(Filename)_fs.hlsl',
        '{DELETE} assets/shaders/hlsl/%(Filename)_vs.hlsl',
        '{DELETE} assets/shaders/hlsl/%(Filename)_fs.hlsl'
    }
    buildoutputs {
        'assets/shaders/hlsl/%(Filename)_fs.cso',
        'assets/shaders/hlsl/%(Filename)_vs.cso',
        'assets/shaders/hlsl/%(Filename)_vs.hlsl.json', 
        'assets/shaders/hlsl/%(Filename)_fs.hlsl.json'
    }
    