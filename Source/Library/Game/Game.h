#pragma once

#include "Common.h"
#include "DDSTextureLoader11.h"

// --------------------------------------------------------------------------------
// 구조체 선언
// --------------------------------------------------------------------------------
struct SimpleVertex
{
	XMFLOAT3 Position;
	XMFLOAT2 TexCoord;
	//	XMFLOAT3 Normal;
};

struct CBView //CBView
{
	XMMATRIX View;
};
struct CBProjection //CBProjection
{
	XMMATRIX Projection;
};
struct CBWorld //CBWorld
{
	XMMATRIX World;
};

struct CBLights
{
	XMFLOAT4 LightPositions[2];
	XMFLOAT4 LightColors[2];
};

// --------------------------------------------------------------------------------
// 함수 선언
// --------------------------------------------------------------------------------

LRESULT CALLBACK WindowProc(_In_ HWND hWnd, _In_ UINT uMsg, _In_ WPARAM wParam, _In_ LPARAM lParam);

HRESULT InitWindow(_In_ HINSTANCE hInstance, _In_ INT nCmdShow);
HRESULT InitDevice();
HRESULT CompileShaderFromFile(_In_ PCWSTR pszFileName, _In_ PCSTR pszEntryPoint, _In_ PCSTR pszShaderModel, _Outptr_ ID3DBlob** ppBlobOut);

void CleanupDevice();
void Render();
