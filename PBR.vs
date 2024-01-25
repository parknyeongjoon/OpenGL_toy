//my
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 WorldPos;
out vec3 Normal;
out vec4 FragPosLightSpace[2];

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;
uniform mat4 lightSpaceMatrix[2];

void main()
{
    WorldPos = vec3(model * vec4(aPos, 1.0));
    Normal = mat3(model) * aNormal;
    TexCoords = vec2(aTexCoords.x, 1.0 - aTexCoords.y);
    for(int i=0; i<2; i++){
      FragPosLightSpace[i] = lightSpaceMatrix[i] * vec4(aPos, 1.0);
    }

    gl_Position =  projection * view * vec4(WorldPos, 1.0);
}