cbuffer ConstantBuffer : register(b0)
{
	matrix World;
	matrix View;
	matrix Projection;
}

struct VS_OUTPUT
{
	float4 Pos : SV_POSITION;
	float4 Color : COLOR0;
};

VS_OUTPUT VS(float4 Pos:POSITION, float4 Color:COLOR)
{
	VS_OUTPUT output = (VS_OUTPUT)0;
	output.Pos = mul(Pos, World);
	output.Pos = mul(output.Pos, View);
	output.Pos = mul(output.Pos, Projection);
	output.Color = Color;

	return output;
}

float4 PS(VS_OUTPUT input) : SV_Target
{
	return input.Color;
}

cbuffer cbLights : register(b3)
{
	float4 LightPositions[2];
	float4 LightColors[2];
}
struct VS_INPUT
{
	float4 Position : POSITION;
	float2 TexCoord : TEXCOORD0;
	float3 Normal : NORMAL;
};
struct PS_INPUT
{
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
	float3 Normal : NORMAL;
	float3 WorldPosition : WORLDPOS;
};

PS_INPUT VS(VS_INPUT input)
{
	PS_INPUT output = (PS_INPUT)0;
	output.Position = mul(input.Position, World);
	output.Position = mul(output.Position, View);
	output.Position = mul(output.Position, Projection);
	output.Normal = normalize(mul(float4(input.Normal, 0.0f), World).xyz);
	output.WorldPosition = mul(input.Position, World);
	output.TexCoord = input.TexCoord;
	return output;
}

