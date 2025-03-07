#ifndef STANDARD_FRAG_INCLUDED
#define STANDARD_FRAG_INCLUDED

float4 frag (v2f i, bool isFrontFace : SV_IsFrontFace) : SV_Target {

    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
    
    InitializeDefaultSampler(defaultSampler);

    float3x3 tangentToWorld;
    float3 viewDir, tangentViewDir;
    CalculateViewDirection(i, viewDir, tangentViewDir, tangentToWorld);

    // For triplanar
    // Easier to just make these global instead of making a struct and passing them around
    worldVertexPos = i.worldPos;
    worldVertexNormal = i.normal;
    localVertexPos = i.localPos;
    localVertexNormal = i.localNorm;

    ApplyParallaxHeight(i, viewDir, tangentViewDir, i.normal, isFrontFace);

    InputData id = (InputData)0;
    InitializeInputData(i, id, tangentToWorld, isFrontFace);

    UNITY_LIGHT_ATTENUATION(atten, i, i.worldPos);
    atten = FadeShadows(i.worldPos, atten);

    LightingData ld = (LightingData)0;
    InitializeLightingData(i, id, ld, viewDir, tangentViewDir, atten);

    #if LTCGI_ENABLED
        CalculateLTCGI(i, id, ld);
    #endif
    #if AREALIT_ENABLED
        CalculateAreaLit(i, id, ld);
    #endif



    CalculateBRDF(i, id, ld);

    #if _VRSL_GI
        CalculateVRSLGI(i, id, i.shadowMaskUV.xy, ld);
    #endif

    ApplyLighting(id, ld);

    float4 diffuse = id.diffuse;


    diffuse.a = id.alpha;
    diffuse.r += defaultSampler.r; // Stopping sampler from getting optimized out

    if (_UnityFogToggle == 1){
        UNITY_APPLY_FOG(i.fogCoord, diffuse);
    }

    DebugView(i, id, ld, diffuse);

    #if _VRSL_ON
        float3 emissionMap = SampleTexture(_DMXEmissionMap, i.uv0.xy);
        switch(_DMXEmissionMapMix)
        {
            default:
            diffuse.rgb += (i.dmxColor * emissionMap);
                break;
            case 1:
            diffuse.rgb += (i.dmxColor + emissionMap);
                break;
            case 2:
            diffuse.rgb = lerp(diffuse.rgb, i.dmxColor, emissionMap.r);
                break;
        }
    #endif

    
    #if _VRSL_AUDIOLINK_ON
        float3 audioLinkEmissionMap = SampleTexture(_AudioLinkEmissionMap, i.uv0.xy);
        diffuse.rgb += (i.audioLinkColor * audioLinkEmissionMap);
    #endif

    
    return diffuse;
}

#endif