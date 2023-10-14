#pragma once

#include "Core.h"

namespace Suyou
{
	class SUYOU_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}


