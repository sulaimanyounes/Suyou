#pragma once

#include "Core.h"
#include "Events/Event.h"
#include "Suyou/Events/ApplicationEvent.h"

#include "Window.h"

namespace Suyou
{
	class SUYOU_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}


