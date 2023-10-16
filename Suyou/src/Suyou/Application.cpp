#include "sypch.h"
#include "Application.h"
#include "Suyou/Events/ApplicationEvent.h"
#include "Suyou/Log.h"

namespace Suyou
{
	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			SY_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			SY_TRACE(e);
		}

		while (true);
	}
}
