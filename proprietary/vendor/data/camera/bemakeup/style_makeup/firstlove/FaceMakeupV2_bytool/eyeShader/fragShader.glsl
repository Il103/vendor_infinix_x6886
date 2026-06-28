#extension GL_ARM_shader_framebuffer_fetch : require

precision highp float;
varying vec2 texCoord;
varying vec2 sucaiTexCoord;
varying float varOpacity;

uniform sampler2D inputImageTexture;
uniform sampler2D videoImageTexture;
uniform sampler2D sucaiImageTexture;
uniform sampler2D sucaiImageTexture1;


uniform float intensity;
#ifdef USE_SEG
 varying vec2 segCoord;
 uniform sampler2D segMaskTexture;
#endif

vec3 blendMultiply(vec3 base, vec3 blend) {
    return base * blend;
}

vec3 blendMultiply(vec3 base, vec3 blend, float opacity) {
    return (blendMultiply(base, blend) * opacity + blend * (1.0 - opacity));
}

float blendScreen(float base, float blend) {
    return 1.0 - ((1.0 - base) * (1.0 - blend));
}

vec3 blendScreen(vec3 base, vec3 blend) {
    return vec3(blendScreen(base.r, blend.r), blendScreen(base.g, blend.g), blendScreen(base.b, blend.b));
}

vec3 blendScreen(vec3 base, vec3 blend, float opacity) {
    return (blendScreen(base, blend) * opacity + blend * (1.0 - opacity));
}

void main(void)
{
    // vec4 src = texture2D(videoImageTexture, texCoord);
    float valid = step(0.0, sucaiTexCoord.x) * step(0.0, sucaiTexCoord.y) * (1.0 - step(1.0, sucaiTexCoord.x)) * (1.0 - step(1.0, sucaiTexCoord.y));
    vec4 sucai = texture2D(sucaiImageTexture, sucaiTexCoord) * valid;
    // vec4 inputimage = texture2D(inputImageTexture, texCoord);
    vec4 inputimage = gl_LastFragColorARM;


    // PIfangan
    vec3 color = blendMultiply(inputimage.rgb, clamp(sucai.rgb * (1.0 / sucai.a), 0.0, 1.0));

#ifdef USE_SEG
    float seg_opacity = (texture2D(segMaskTexture, segCoord)).x;
    if(clamp(segCoord, 0.0, 1.0) != segCoord) seg_opacity = 1.0;
    color = mix(inputimage.rgb, color, seg_opacity);
#endif


    float alpha = sucai.a*intensity * varOpacity;
    color = mix(inputimage.rgb, color, alpha);
    {
        vec4 sucai1 = texture2D(sucaiImageTexture1, sucaiTexCoord) * valid;

        vec3 color2 = color;
        // PIfangan
        color2 = blendScreen(color2, clamp(sucai1.rgb * (1.0 / sucai1.a), 0.0, 1.0));

        #ifdef USE_SEG
            color2 = mix(inputimage.rgb, color2, seg_opacity);
        #endif

        float alpha = sucai1.a * intensity * varOpacity;
        gl_FragColor = vec4(mix(color, color2, alpha), 1.0);
    }
}
