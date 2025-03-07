// By Mochie
// https://github.com/MochiesCode/Mochies-Unity-Shaders

Shader "Mochie/Standard+VRSL" {
    Properties { 
          
        // Variant
        [Enum(Opaque,0, Cutout,1, Fade,2, Transparent,3)]_BlendMode("Blending Mode", Int) = 0
        [Enum(Base Color Alpha,0, Alpha Mask,1)]_AlphaSource("Alpha Source", Int) = 0
        [Enum(Off,0, On,1)]_MipMapRescaling("Mip Map Rescaling", Int) = 1
        _Cutoff("Alpha Cutoff", Range(0,1)) = 0.5
        _MipMapScale("Mip Map Scale", Float) = 0.25
        [Enum(Off,0, On,1)]_SmoothnessToggle("Use Smoothness", Int) = 0
        [Enum(Local,0, World,1)]_TriplanarCoordSpace("Triplanar Coordinate Space", Int) = 0

        // Primary Textures
        [Enum(Separate,0, Packed,1)]_PrimaryWorkflow("Primary Workflow", Int) = 0
        [Enum(Default,0, Stochastic,1, Supersampling,2, Triplanar,3)]_PrimarySampleMode("Primary Sampling Mode", Int) = 0
        _MainTex("Base Color", 2D) = "white" {}
        _Color("Color", Color) = (1,1,1,1)
        _NormalMap("Normal Map", 2D) = "bump" {}
        _NormalStrength("Normal Strength", Float) = 1
        _SampleMetallic("Sample Metallic Map", Int) = 0
        _MetallicMap("Metallic Map", 2D) = "white" {}
        _MetallicStrength("Metallic Strength", Range(0,1)) = 0
        _SampleRoughness("Sample Roughness Map", Int) = 0
        _RoughnessMap("Roughness Map", 2D) = "white" {}
        _RoughnessStrength("Roughness Strength", Range(0,1)) = 1
        _SampleOcclusion("Sample Occlusion Map", Int) = 0
        _OcclusionMap("Occlusion Map", 2D) = "white" {}
        _OcclusionStrength("Occlusion Strength", Range(0,1)) = 1
        _HeightMap("Height Map", 2D) = "black" {}
        _HeightStrength("Height Strength", Range(0,0.2)) = 0.02
        _HeightOffset("Height Offset", Range(-1, 1)) = 0
        [IntRange]_HeightSteps("Height Steps", Range(1,16)) = 8

        _PackedMap("Packed Map", 2D) = "white" {}
        [Enum(Off,0, On,1)]_PackedHeight("Packed Height", Int) = 0
		[ToggleUI]_RoughnessMultiplier("Roughness Multiplier", Int) = 0
		[ToggleUI]_MetallicMultiplier("Metallic Multiplier", Int) = 0
		[ToggleUI]_OcclusionMultiplier("Occlusion Multiplier", Int) = 0
		[ToggleUI]_HeightMultiplier("Height Multiplier", Int) = 0
		[Enum(Red,0, Green,1, Blue,2, Alpha,3)]_RoughnessChannel("Roughness Channel", Int) = 1
		[Enum(Red,0, Green,1, Blue,2, Alpha,3)]_MetallicChannel("Metallic Channel", Int) = 2
		[Enum(Red,0, Green,1, Blue,2, Alpha,3)]_OcclusionChannel("Occlusion Channel", Int) = 0
		[Enum(Red,0, Green,1, Blue,2, Alpha,3)]_HeightChannel("Height Channel", Int) = 3

		[Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVMainSet("UV Set for primary textures", Int) = 0
		[Enum(XY,0, XZ,1, YZ,2)]_UVMainSwizzle("Swizzle", Int) = 0
        _UVMainScroll("Scroll Speed", Vector) = (0,0,0,0)
        _UVMainRotation("Rotation", Float) = 0

        // Emission/Audiolink
        _EmissionMap("Emission Map", 2D) = "white" {}
        _EmissionStrength("Emission Strength", Float) = 1
        [HDR]_EmissionColor("Emission Color", Color) = (0,0,0)
		[Enum(Off,0, Sin,1, Square,2, Triangle,3, Saw,4, Reverse Saw,5)]_EmissionPulseWave("Pulse", Int) = 0
		_EmissionPulseSpeed("Pulse Speed", Float) = 1
		_EmissionPulseStrength("Pulse Strength", Float) = 1
		[Enum(Off,0, Bass,1, Low Mids,2, Upper Mids,3, Highs,4)]_AudioLinkEmission("Emission Band", Int) = 0
		_AudioLinkEmissionStrength("Emission Strength", Float) = 1
		[ToggleUI]_AudioLinkEmissionMeta("Audio Link Meta Emission", Int) = 0
		_AudioLinkMin("Audio Link Min", Float) = 0
		_AudioLinkMax("Audio Link Max", Float) = 1

        // Detail Textures
        [Enum(Separate,0, Packed,1)]_DetailWorkflow("Detail Workflow", Int) = 0
        [Enum(Default,0, Stochastic,1, Supersampling,2, Triplanar,3)]_DetailSampleMode("Detail Sampling Mode", Int) = 0
        _DetailMainTex("Base Color", 2D) = "white" {}
        _DetailColor("Color", Color) = (1,1,1,1)
        _DetailMainTexStrength("Detail Base Color Strength", Range(0,1)) = 1
        [Enum(Add,0, Alpha,1, Mul,2, Mulx2,3, Overlay,4, Screen,5, Lerp,6)]_DetailMainTexBlend("Detail Base Color Blend", Int) = 2
        _DetailNormalMap("Normal Map", 2D) = "bump" {}
        _DetailNormalStrength("Normal Strength", Float) = 1
        _DetailMetallicMap("Metallic Map", 2D) = "white" {}
        _DetailMetallicStrength("Metallic Strength", Range(0,1)) = 0
        [Enum(Add,0, Alpha,1, Mul,2, Mulx2,3, Overlay,4, Screen,5, Lerp,6)]_DetailMetallicBlend("Detail Metallic Blend", Int) = 2
        _DetailRoughnessMap("Roughness Map", 2D) = "white" {}
        _DetailRoughnessStrength("Roughness Strength", Range(0,1)) = 1
        [Enum(Add,0, Alpha,1, Mul,2, Mulx2,3, Overlay,4, Screen,5, Lerp,6)]_DetailRoughnessBlend("Detail Roughness Blend", Int) = 2
        _DetailOcclusionMap("Occlusion Map", 2D) = "white" {}
        _DetailOcclusionStrength("Occlusion Strength", Range(0,1)) = 1
        [Enum(Add,0, Alpha,1, Mul,2, Mulx2,3, Overlay,4, Screen,5, Lerp,6)]_DetailOcclusionBlend("Detail Occlusion Blend", Int) = 2

        _DetailPackedMap("Packed Map", 2D) = "white" {}
        [ToggleUI]_DetailRoughnessMultiplier("Roughness Multiplier", Int) = 0
		[ToggleUI]_DetailMetallicMultiplier("Metallic Multiplier", Int) = 0
		[ToggleUI]_DetailOcclusionMultiplier("Occlusion Multiplier", Int) = 0
		[Enum(Red,0, Green,1, Blue,2, Alpha,3)]_DetailRoughnessChannel("Roughness Channel", Int) = 1
		[Enum(Red,0, Green,1, Blue,2, Alpha,3)]_DetailMetallicChannel("Metallic Channel", Int) = 2
		[Enum(Red,0, Green,1, Blue,2, Alpha,3)]_DetailOcclusionChannel("Occlusion Channel", Int) = 0

        [Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVDetailSet("UV Set for detail textures", Int) = 0
		[Enum(XY,0, XZ,1, YZ,2)]_UVDetailSwizzle("Swizzle", Int) = 0
        _UVDetailScroll("Scroll Speed", Vector) = (0,0,0,0)
        _UVDetailRotation("Rotation", Float) = 0
        
        // Independant Textures
        _DetailMask("Detail Mask", 2D) = "white" {}
        [Enum(Red,0, Green,1, Blue,2, Alpha,3)]_DetailMaskChannel("Detail Mask Channel", Int) = 0
        [Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVDetailMaskSet("UV Set for detail mask", Int) = 0
        [Enum(XY,0, XZ,1, YZ,2)]_UVDetailMaskSwizzle("Swizzle", Int) = 0
        _UVDetailMaskScroll("Scroll Speed", Vector) = (0,0,0,0)
        _UVDetailMaskRotation("Rotation", Float) = 0

        _HeightMask("Height Mask", 2D) = "white" {}
        [Enum(Red,0, Green,1, Blue,2, Alpha,3)]_HeightMaskChannel("Height Mask Channel", Int) = 0
        [Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVHeightMaskSet("UV Set for Height mask", Int) = 0
        [Enum(XY,0, XZ,1, YZ,2)]_UVHeightMaskSwizzle("Swizzle", Int) = 0
        _UVHeightMaskScroll("Scroll Speed", Vector) = (0,0,0,0)
        _UVHeightMaskRotation("Rotation", Float) = 0

        _RainMask("Rain Mask", 2D) = "white" {}
        [Enum(Red,0, Green,1, Blue,2, Alpha,3)]_RainMaskChannel("Rain Mask Channel", Int) = 0
        [Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVRainMaskSet("UV Set for Rain mask", Int) = 0
        [Enum(XY,0, XZ,1, YZ,2)]_UVRainMaskSwizzle("Swizzle", Int) = 0
        _UVRainMaskScroll("Scroll Speed", Vector) = (0,0,0,0)
        _UVRainMaskRotation("Rotation", Float) = 0

        _EmissionMask("Mask", 2D) = "white" {}
        [Enum(Red,0, Green,1, Blue,2, Alpha,3)]_EmissionMaskChannel("Emission Mask Channel", Int) = 0
        [Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVEmissionMaskSet("UV Set for Emission mask", Int) = 0
        [Enum(XY,0, XZ,1, YZ,2)]_UVEmissionMaskSwizzle("Swizzle", Int) = 0
        _UVEmissionMaskScroll("Scroll Speed", Vector) = (0,0,0,0)
        _UVEmissionMaskRotation("Rotation", Float) = 0

        _AlphaMask("Alpha Mask", 2D) = "white" {}
        [Enum(Red,0, Green,1, Blue,2, Alpha,3)]_AlphaMaskChannel("Alpha Mask Channel", Int) = 0
        [Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVAlphaMaskSet("UV Set for Alpha mask", Int) = 0
        [Enum(XY,0, XZ,1, YZ,2)]_UVAlphaMaskSwizzle("Swizzle", Int) = 0
        _UVAlphaMaskScroll("Scroll Speed", Vector) = (0,0,0,0)
        _UVAlphaMaskRotation("Rotation", Float) = 0

        // Specularity
        [Enum(Unity Standard,0, Google Filament,1)]_ShadingModel("Specular Model", Int) = 0
		[ToggleUI]_ReflectionsToggle("Reflections", Int) = 1
		[ToggleUI]_SpecularHighlightsToggle("Specular Highlights", Int) = 1
		_ReflectionStrength("Reflection Strength", Float) = 1
		_SpecularHighlightStrength("Specular Strength", Float) = 1
		[ToggleUI]_FresnelToggle("Fresnel", Int) = 1
		_FresnelStrength("Fresnel Strength", Float) = 1
		[ToggleUI]_SpecularOcclusionToggle("Specular Occlusion", Int) = 0
		_SpecularOcclusionStrength("Specular Occlusion Strength", Float) = 1
		_SpecularOcclusionContrast("Contrast", Float) = 1
		_SpecularOcclusionBrightness("Brightness", Float) = 20
		_SpecularOcclusionHDR("HDR", Float) = 1
		_SpecularOcclusionTint("Tint", Color) = (1,1,1,1)
		[ToggleUI]_SSRToggle("Screenspace Reflections", Int) = 0
		_SSRStrength("SSR Strength", Float) = 1
		_SSREdgeFade("Edge Fade", Range(0,1)) = 0.1
		_SSRHeight("SSR Height", Float) = 0.2
        _ContactHardening("Contact Hardening", Range(0,1)) = 0
        [ToggleUI]_GSAAToggle("GSAA", Int) = 0
        _GSAAStrength("GSAA Strength", Float) = 1
        _IndirectSpecularOcclusionStrength("Baked Spec Occlusion Strength", Range(0,1)) = 0.2
        _RealtimeSpecularOcclusionStrength("Realtime Spec Occlusion Strength", Range(0,1)) = 0

        // Subsurface Scattering
        [ToggleUI]_Subsurface("Subsurface Scattering", Int) = 0
		[ToggleUI]_ScatterBaseColorTint("Scatter Base Color Tint", Int) = 0
		_ThicknessMap("Thickness Map", 2D) = "black" {}
		_ThicknessMapPower("Thickness Map Power", Float) = 1
		_ScatterCol("Subsurface Color", Color) = (1,1,1,1)
		_ScatterIntensity("Intensity", Range(0,10)) = 1
		_ScatterPow("Power", Range(0.01,10)) = 1
		_ScatterDist("Distance", Range(0,10)) = 1
		_ScatterAmbient("Ambient Intensity", Range(0,0.5)) = 0
		_ScatterShadow("Shadow Power", Range(0,1)) = 1
		_WrappingFactor("Wrapping Factor", Range(0.001, 1)) = 0.01

        // Rain
		[Enum(Off,0, Droplets,1, Ripples,2, Automatic,3)]_RainMode("Mode", Int) = 0
		[Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVRainSet("Rain UVs", Float) = 0
		[Enum(XY,0, XZ,1, YZ,2)]_UVRainSwizzle("Swizzle", Int) = 0
		_UVRainRotation("Rotation", Float) = 0
        [Enum(UV0,0, UV1,1, UV2,2, UV3,3, UV4,4, World,5, Local,6)]_UVRippleSet("Ripple UVs", Float) = 0
		[Enum(XY,0, XZ,1, YZ,2)]_UVRippleSwizzle("Swizzle", Int) = 0
		_UVRippleRotation("Rotation", Float) = 0
		[HideInInspector]_RainSheet("Rain Texture Sheet", 2D) = "black" {}
		[HideInInspector]_RainRows("Rows", Float) = 8
		[HideInInspector]_RainColumns("Columns", Float) = 8
		_RainSpeed("Speed", Float) = 60
        _RainScale("Rain Scale", Vector) = (1,1,0,0)
		_RainStrength("Normal Strength", Float) = 0.3
		_DropletMask("Rain Droplet Mask", 2D) = "white" {}
        _DynamicDroplets("Droplet Strength", Range(0,1)) = 0.5
		_RainThreshold("Threshold", Range(0,1)) = 0.01
        _RainThresholdSize("Threshold Size", Range(0,1)) = 0.01
		_RippleScale("Ripple Scale", Vector) = (40,40,0,0)
		_RippleSpeed("Ripple Speed", Float) = 18
		_RippleStrength("Ripple Strength", Float) = 1
		_RippleDensity("Ripple Density", Float) = 0.3
		_RippleSize("Ripple Size", Float) = 2

        // Filtering
		[ToggleUI]_Filtering("Filtering", Int) = 0
		[Enum(HSV,0, Oklab,1)]_HueMode("Hue Mode", Int) = 0
		[ToggleUI]_MonoTint("Mono Tint", Int) = 0
		_Hue("Hue", Range(0,1)) = 0
		_Contrast("Contrast", Float) = 1
		_Saturation("Saturation", Float) = 1
		_Brightness("Brightness", Float) = 1
		_ACES("ACES", Float) = 0

		_HueDet("Hue", Range(0,1)) = 0
		_ContrastDet("Contrast", Float) = 1
		_BrightnessDet("Brightness", Float) = 1
		_SaturationDet("Saturation", Float) = 1

		_HueEmiss("Hue", Range(0,1)) = 0
		_ContrastEmiss("Contrast", Float) = 1
		_SaturationEmiss("Saturation", Float) = 1
		_BrightnessEmiss("Brightness", Float) = 1

		_HuePost("Hue", Range(0,1)) = 0
		_ContrastPost("Contrast", Float) = 1
		_SaturationPost("Saturation", Float) = 1
		_BrightnessPost("Brightness", Float) = 1

		// Lightmapping stuff
		[ToggleUI] _BAKERY_LMSPEC ("Lightmap Specular", Float) = 0
		[ToggleUI] _BAKERY_SHNONLINEAR ("Non-Linear SH", Float) = 0
		[ToggleUI]_BicubicSampling("Bicubic Sampling", Int) = 1
        [ToggleUI]_ApplyHeightOffset("Apply Height Offset", Int) = 0
		[Enum(None, 0, SH, 1, RNM, 2, MONOSH, 3)] _BakeryMode ("Bakery Mode", Int) = 0
		[ToggleUI]_IgnoreRealtimeGI("Ignore Realtime GI", Int) = 0
		_RNM0("RNM0", 2D) = "black" {}
		_RNM1("RNM1", 2D) = "black" {}
		_RNM2("RNM2", 2D) = "black" {}

		// AreaLit
		[ToggleUI]_AreaLitToggle("Enable", Int) = 0
		_AreaLitStrength("Strength", Float) = 1
		_AreaLitRoughnessMultiplier("Roughness Multiplier", Int) = 1
		[ToggleUI]_AreaLitSpecularOcclusion("Apply Specular Occlusion", Float) = 0
		[NoScaleOffset]_LightMesh("Light Mesh", 2D) = "black" {}
		[NoScaleOffset]_LightTex0("Light Texture 0", 2D) = "white" {}
		[NoScaleOffset]_LightTex1("Light Texture 1", 2D) = "black" {}
		[NoScaleOffset]_LightTex2("Light Texture 2", 2D) = "black" {}
		[NoScaleOffset]_LightTex3("Light Texture 3", 2DArray) = "black" {}
		[ToggleOff]_OpaqueLights("Opaque Lights", Float) = 1.0
		_AreaLitOcclusion("Occlusion", 2D) = "white" {}
		[Enum(UV0,0,UV1,1, UV2,2, UV3,3, UV4,4, Lightmap UV,5)]_AreaLitOcclusionUVSet("UV Set for occlusion map", Float) = 0
		
		// LTCGI
		[ToggleUI]_LTCGI("LTCGI", Int) = 0
		_LTCGI_mat("LTC Mat", 2D) = "black" {}
        _LTCGI_amp("LTC Amp", 2D) = "black" {}
		_LTCGIStrength("LTCGI Strength", Float) = 1
		_LTCGIRoughness("LTCGI Roughness", Float) = 1
        [ToggleUI]_LTCGISpecularOcclusion("Apply Specular Occlusion", Int) = 0
        _LTCGI_DiffuseColor ("LTCGI Diffuse Color", Color) = (1,1,1,1)
        _LTCGI_SpecularColor ("LTCGI Specular Color", Color) = (1,1,1,1)


        // VRSL DMX
        [ToggleUI] _VRSLToggle ("Enable VRSL", Int) = 0
        _DMXChannel ("Starting DMX Channel", Int) = 0
        _ThirteenChannelMode ("13-Channel Mode", Int) = 0
        [ToggleUI] _UseLegacyDMXTextures ("Legacy DMX Textures", Int) = 0
        [NoScaleOffset] _OSCGridRenderTextureRAW("OSC Grid Render Texture (RAW Unsmoothed)", 2D) = "white" {}
		[NoScaleOffset] _OSCGridRenderTexture("OSC Grid Render Texture (To Control Lights)", 2D) = "white" {}
		[NoScaleOffset] _OSCGridStrobeTimer ("OSC Grid Render Texture (For Strobe Timings", 2D) = "white" {}
        [ToggleUI] _NineUniverseMode ("Extended Universe Mode", Int) = 0
        _DMXEmissionMap("DMX Emission Map", 2D) = "white" {}
        [HDR]_EmissionDMX("Color", Color) = (1,1,1)
        [ToggleUI] _DMXEmissionMapMix ("Mixture", Int) = 0
        _UniversalIntensity ("Universal Intensity", Range (0,1)) = 1
        _FinalIntensity("Final Intensity", Range(0,1)) = 1
        _GlobalIntensity("Global Intensity", Range(0,1)) = 1
        _GlobalIntensityBlend("Global Intensity Blend", Range(0,1)) = 1
        _FixtureMaxIntensity ("Maximum Cone Intensity",Range (0,500)) = 1.0
        [ToggleUI] _EnableStrobe ("Enable Strobe", Int) = 0
        _FixtureRotationOrigin("Fixture Pivot Origin", Float) = (0, 0.014709, -1.02868, 0)
        [ToggleUI] _EnablePanMovement ("Enable Pan Movement", Int) = 0
        _MaxMinPanAngle("Max/Min Pan Angle (-x, x)", Float) = 180
        _FixtureBaseRotationY("Mover Pan Offset (Blue + Green)", Range(-540,540)) = 0
        [ToggleUI] _PanInvert ("Invert Mover Pan", Int) = 0
        [ToggleUI] _EnableTiltMovement ("Enable Tilt Movement", Int) = 0
        _MaxMinTiltAngle("Max/Min Tilt Angle (-y, y)", Float) = 180
        _FixtureRotationX("Mover Tilt Offset (Blue)", Range(-180,180)) = 0
        [ToggleUI] _TiltInvert ("Invert Mover Tilt", Int) = 0

        // VRSL AudioLink
        [ToggleUI]_EnableVRSLAudioLink("Enable VRSL Audiolink", Int) = 0
        _AudioLinkEmissionMap("AudioLink Emission Map", 2D) = "white" {}
        [HDR]_Emission("Light Color Tint", Color) = (1,1,1,1)
        [ToggleUI]_EnableAudioLink("Enable Audiolink", Int) = 0
        [Enum(Bass,0,Low Mids,1,High Mids,2,Treble,3)]_Band("Band", Float) = 0
        _BandMultiplier("Band Multiplier", Range(1, 15)) = 1
        _Delay("Delay", Float) = 0
        [Toggle] _EnableColorChord ("Enable Color Chord Tinting", Int) = 0
        [Toggle] _EnableColorTextureSample ("Enable Color Texture Sampling", Int) = 0
        _SamplingTexture ("Texture To Sample From for Color", 2D) = "white" {}
        _TextureColorSampleX ("X coordinate to sample the texture from", Range(0,1)) = 0.5
        _TextureColorSampleY ("Y coordinate to sample the texture from", Range(0,1)) = 0.5
        _RenderTextureMultiplier("Render Texture Multiplier", Range(1,10)) = 1
        [Toggle] _EnableThemeColorSampling ("Enable Theme Color Sampling", Int) = 0
        [Enum(ThemeColor0,0,ThemeColor1,1,ThemeColor2,2,ThemeColor3,3)]_ThemeColorTarget ("Choose Theme Color", Float) = 0

        //VRSL GI
        [ToggleOff] _UseVRSLGI("Use VRSL GI", Float) = 1.0
        [ToggleOff] _UseVRSLGIFoldout("Use VRSL GI Foldout", Float) = 1.0
        [ToggleOff] _UseOcclussionWithGI("Use Occlussion Map With GI", Float) = 1.0
        _VRSLGIStrength("GI Strength", Float) = 1.0
        _VRSLDiffuseMix ("VRSL Diffuse Mix", Range(0, 1)) = 1.0
        _VRSLGIDiffuseClamp("VRSL GI Diffuse Clamp", Range(0, 1)) = 0
        [ToggleOff] _VRSLGIIgnoreDirectionalLights("Ignore Spotlights/Directional Lights", Float) = 0.0
        [Toggle] _ClusterDebug ("Clustering Debug Mode", Int) = 0
        [Toggle] _ClusterDebugFalloff ("Cluster Debug Falloff Visual", Int) = 0
        [ToggleOff] _UseVRSLGISpecular("Use VRSL GI Specular", Float) = 1.0
        [ToggleUI] _ShowAdvancedGIFeatures("Show Advanced GI Features", Float) = 0.0 
        _VRSLGIRoughnessMult("Roughness Multiplier", Float) = 1
        [ToggleUI] _VRSLGIRouhgnessInvert("Invert VRSLGI Roughness", Float) = 0.0
        _VRSLGIMetallicMult("Metallic Multiplier", Float) = 1
        [ToggleUI] _VRSLInvertMetallicMap("VRSL GI Invert Metallic Map", Float) = 0.0
        _VRSLSpecularMultiplier("Specular Multiplier", Float) = 1.0
        _VRSLGISpecularClamp("VRSL GI Specular Clamp", Range(1.0, 50000.0)) = 10000
        [Enum(UV0,0,UV1,1, UV2,2, UV3,3, UV4,4, UV1_LightmapST,5)]_VRSLShadowMaskUVSet("UV Set for occlusion map", Float) = 1
        [Enum(R,0,RG,1,RGB,2,RGBA,3)] _ShadowMaskActiveChannels ("Shadow Mask Active Channels", Int) = 0
        [ToggleUI] _UseVRSLShadowMask1 ("Use VRSL Shadow Mask 1", Int) = 0
        [NoScaleOffset] _VRSLShadowMask1("VRSL GI ShadowMask 1", 2D) = "white" {}
        _UseVRSLShadowMask1RStrength("VRSL SM 1 R Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask1GStrength("VRSL SM 1 G Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask1BStrength("VRSL SM 1 B Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask1AStrength("VRSL SM 1 A Strength", Range(0.0, 1.0)) = 1.0
        [ToggleUI] _UseVRSLShadowMask2 ("Use VRSL Shadow Mask 2", Int) = 0
        [NoScaleOffset] _VRSLShadowMask2("VRSL GI ShadowMask 2", 2D) = "white" {}
        _UseVRSLShadowMask2RStrength("VRSL SM 2 R Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask2GStrength("VRSL SM 2 G Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask2BStrength("VRSL SM 2 B Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask2AStrength("VRSL SM 2 A Strength", Range(0.0, 1.0)) = 1.0
        [ToggleUI] _UseVRSLShadowMask3 ("Use VRSL Shadow Mask 3", Int) = 0
        [NoScaleOffset] _VRSLShadowMask3("VRSL GI ShadowMask 3", 2D) = "white" {}
        _UseVRSLShadowMask3RStrength("VRSL SM 3 R Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask3GStrength("VRSL SM 3 G Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask3BStrength("VRSL SM 3 B Strength", Range(0.0, 1.0)) = 1.0
        _UseVRSLShadowMask3AStrength("VRSL SM 3 A Strength", Range(0.0, 1.0)) = 1.0

        // Render Settings
        [Enum(UnityEngine.Rendering.CullMode)]_Culling("Cull", Int) = 2
        _QueueOffset("Queue Offset", Int) = 0
        [ToggleUI]_UnityFogToggle("Unity Fog", Int) = 1
        [ToggleUI]_VertexBaseColor("Vertex Base Color", Int) = 0
        
        // Debug Views
        [ToggleUI]_DebugEnable("Enable Debug View", Int) = 0
        [ToggleUI]_DebugVertexColors("Vertex Colors", Int) = 0
		[ToggleUI]_DebugBaseColor("Base Color", Int) = 1
		[ToggleUI]_DebugNormals("Normals", Int) = 0
		[ToggleUI]_DebugRoughness("Roughness", Int) = 0
		[ToggleUI]_DebugMetallic("Metallic", Int) = 0
		[ToggleUI]_DebugOcclusion("Occlusion", Int) = 0
		[ToggleUI]_DebugHeight("Height", Int) = 0
		[ToggleUI]_DebugAtten("Attenuation", Int) = 0
		[ToggleUI]_DebugReflections("Reflections", Int) = 0
		[ToggleUI]_DebugSpecular("Specular Highlights", Int) = 0
        [ToggleUI]_DebugAlpha("Alpha", Int) = 0
        [ToggleUI]_DebugLighting("Alpha", Int) = 0

        // NO TOUCHY
        [HideInInspector]_SrcBlend("__src", Float) = 1.0
        [HideInInspector]_DstBlend("__dst", Float) = 0.0
        [HideInInspector]_ZWrite("__zw", Float) = 1.0
		[HideInInspector]_ZTest("__zt", Float) = 4.0
        [HideInInspector]_MaterialResetCheck("Reset Check", Int) = 0
        [HideInInspector]_NoiseTexSSR("SSR Noise Tex", 2D) = "black"
        [HideInInspector]_DefaultSampler("DO NOT REMOVE THIS", 2D) = "white" {}
        [HideInInspector]_DFG("LUT for Filament SM", 2D) = "white" {}
        [HideInInspector]_AlphaToMask("Alpha Coverage", Int) = 0
        [ToggleUI]_MaterialDebugMode("Debug Mode", Int) = 0

    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
            "RenderQueue"="Geometry"
			"PerformanceChecks"="False"
			"LTCGI"="_LTCGI"
        }
        GrabPass {
			Tags {"LightMode"="Always"}
			"_GrabTexture"
		}
        Cull [_Culling]
        ZTest [_ZTest]
        AlphaToMask [_AlphaToMask]
        
        Pass {
            Name "FORWARD"
            Tags {"LightMode" = "ForwardBase"}
            Blend [_SrcBlend] [_DstBlend]
            ZWrite [_ZWrite]

            CGPROGRAM
            #pragma target 5.0
            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature_local _ _ALPHATEST_ON _ALPHABLEND_ON _ALPHAPREMULTIPLY_ON
            #pragma shader_feature_local _ _STOCHASTIC_ON _TRIPLANAR_ON _SUPERSAMPLING_ON
            #pragma shader_feature_local _ _STOCHASTIC_DETAIL_ON _TRIPLANAR_DETAIL_ON _SUPERSAMPLING_DETAIL_ON
            #pragma shader_feature_local _ _RAIN_DROPLETS_ON _RAIN_RIPPLES_ON _RAIN_AUTO_ON
            #pragma shader_feature_local _REFLECTIONS_ON
            #pragma shader_feature_local _SPECULAR_HIGHLIGHTS_ON
            #pragma shader_feature_local _WORKFLOW_PACKED_ON
            #pragma shader_feature_local _WORKFLOW_DETAIL_PACKED_ON
            #pragma shader_feature_local _EMISSION_ON
            #pragma shader_feature_local _PARALLAX_ON
            #pragma shader_feature_local _NORMALMAP_ON
            #pragma shader_feature_local _DETAIL_MAINTEX_ON
            #pragma shader_feature_local _DETAIL_NORMAL_ON
            #pragma shader_feature_local _DETAIL_METALLIC_ON
            #pragma shader_feature_local _DETAIL_ROUGHNESS_ON
            #pragma shader_feature_local _DETAIL_OCCLUSION_ON
			#pragma shader_feature_local _AREALIT_ON
			#pragma shader_feature_local _OPAQUELIGHTS_OFF
			#pragma shader_feature_local _SSR_ON
            #pragma shader_feature_local _AUDIOLINK_ON
            #pragma shader_feature_local _BICUBIC_SAMPLING_ON
			#pragma shader_feature_local LTCGI
			#pragma shader_feature_local BAKERY_LMSPEC
			#pragma shader_feature_local BAKERY_SHNONLINEAR
			#pragma shader_feature_local _ BAKERY_SH BAKERY_RNM BAKERY_MONOSH
            //VRSL Stuff
			#pragma shader_feature_local _VRSL_ON
			#pragma shader_feature_local _ _VRSLTHIRTEENCHAN_ON _VRSLONECHAN_ON
			#pragma shader_feature_local _VRSL_LEGACY_TEXTURES
			#pragma shader_feature_local _VRSL_AUDIOLINK_ON
			#pragma shader_feature_local _VRSL_GI
            #pragma shader_feature_local _VRSL_GI_SPECULARHIGHLIGHTS
			#pragma shader_feature_local _VRSL_SHADOWMASK1
            #pragma shader_feature_local _VRSL_SHADOWMASK2
            #pragma shader_feature_local _VRSL_SHADOWMASK3
			#pragma shader_feature_local _ _VRSL_SHADOWMASK_RG _VRSL_SHADOWMASK_RGB _VRSL_SHADOWMASK_RGBA
            #pragma shader_feature_local _VRSLGI_CBIRP_DEBUG
			#pragma multi_compile_fog
            #pragma multi_compile_fwdbase
            #pragma multi_compile_instancing
            #include "StandardDefines.cginc"

            ENDCG
        }

        Pass {
            Name "FORWARD_DELTA"
            Tags {"LightMode" = "ForwardAdd"}
            Blend [_SrcBlend] One
            Fog {Color (0,0,0,0)}
            ZWrite Off

            CGPROGRAM
            #pragma target 5.0
			#pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature_local _ _ALPHATEST_ON _ALPHABLEND_ON _ALPHAPREMULTIPLY_ON
            #pragma shader_feature_local _ _STOCHASTIC_ON _TRIPLANAR_ON _SUPERSAMPLING_ON
            #pragma shader_feature_local _ _STOCHASTIC_DETAIL_ON _TRIPLANAR_DETAIL_ON _SUPERSAMPLING_DETAIL_ON
            #pragma shader_feature_local _ _RAIN_DROPLETS_ON _RAIN_RIPPLES_ON _RAIN_AUTO_ON
            #pragma shader_feature_local _SPECULAR_HIGHLIGHTS_ON
            #pragma shader_feature_local _WORKFLOW_PACKED_ON
            #pragma shader_feature_local _WORKFLOW_DETAIL_PACKED_ON
            #pragma shader_feature_local _PARALLAX_ON
            #pragma shader_feature_local _SUBSURFACE_ON
            #pragma shader_feature_local _NORMALMAP_ON
            #pragma shader_feature_local _DETAIL_MAINTEX_ON
            #pragma shader_feature_local _DETAIL_NORMAL_ON
            #pragma shader_feature_local _DETAIL_METALLIC_ON
            #pragma shader_feature_local _DETAIL_ROUGHNESS_ON
            #pragma shader_feature_local _DETAIL_OCCLUSION_ON
            //VRSL Stuff
            #pragma shader_feature_local _VRSL_ON
            #pragma shader_feature_local _ _VRSLTHIRTEENCHAN_ON _VRSLONECHAN_ON
            #pragma shader_feature_local _VRSL_LEGACY_TEXTURES
			#pragma multi_compile_fog
            #pragma multi_compile_fwdadd_fullshadows
			#pragma multi_compile_instancing
            #include "StandardDefines.cginc"

            ENDCG
        }
        
        Pass {
            Tags {"LightMode" = "ShadowCaster"}
            CGPROGRAM
            #pragma target 5.0
            #pragma vertex vert
            #pragma fragment frag
            #pragma shader_feature_local _ _ALPHATEST_ON _ALPHABLEND_ON _ALPHAPREMULTIPLY_ON
            #pragma shader_feature_local _ _STOCHASTIC_ON _TRIPLANAR_ON _SUPERSAMPLING_ON
            #pragma shader_feature_local _ _STOCHASTIC_DETAIL_ON _TRIPLANAR_DETAIL_ON _SUPERSAMPLING_DETAIL_ON
            #pragma shader_feature_local _WORKFLOW_PACKED_ON
            #pragma shader_feature_local _WORKFLOW_DETAIL_PACKED_ON
            #pragma shader_feature_local _DETAIL_METALLIC_ON
            //VRSL Stuff
            #pragma shader_feature_local _VRSL_ON
			#pragma shader_feature_local _ _VRSLTHIRTEENCHAN_ON _VRSLONECHAN_ON
			#pragma shader_feature_local _VRSL_LEGACY_TEXTURES
            #pragma multi_compile_instancing
            #pragma multi_compile_shadowcaster
            #define SHADOWCASTER_PASS
            #include "StandardDefines.cginc"

            ENDCG
        }

        Pass {
			Name "META"
			Tags {"LightMode"="Meta"}
			Cull Off

			CGPROGRAM
            #pragma target 5.0
			#pragma vertex vert
			#pragma fragment frag
            #pragma shader_feature_local _ _ALPHATEST_ON _ALPHABLEND_ON _ALPHAPREMULTIPLY_ON
            #pragma shader_feature_local _ _STOCHASTIC_ON _TRIPLANAR_ON _SUPERSAMPLING_ON
            #pragma shader_feature_local _ _STOCHASTIC_DETAIL_ON _TRIPLANAR_DETAIL_ON _SUPERSAMPLING_DETAIL_ON
            #pragma shader_feature_local _WORKFLOW_PACKED_ON
            #pragma shader_feature_local _WORKFLOW_DETAIL_PACKED_ON
            #pragma shader_feature_local _EMISSION_ON
            #pragma shader_feature_local _NORMALMAP_ON
            #pragma shader_feature_local _DETAIL_MAINTEX_ON
            #pragma shader_feature_local _DETAIL_NORMAL_ON
            #pragma shader_feature_local _DETAIL_METALLIC_ON
            #pragma shader_feature_local _DETAIL_ROUGHNESS_ON
            #pragma shader_feature_local _DETAIL_OCCLUSION_ON
            #pragma shader_feature_local _AUDIOLINK_ON
            #pragma shader_feature_local _AUDIOLINK_META_ON
			#pragma shader_feature EDITOR_VISUALIZATION
            #define META_PASS
			#include "StandardDefines.cginc"
			ENDCG
        }
    }
    CustomEditor "StandardEditor"
}
