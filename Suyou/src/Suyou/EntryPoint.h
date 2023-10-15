#pragma once

#ifdef SY_PLATFORM_WINDOWS

extern Suyou::Application* Suyou::CreateApplication();

int main(int argc, char** argv)
{
	Suyou::Log::Init();
	SY_CORE_WARN("Initialized Log!");

	int a = 5;
	SY_TRACE("Hello! Var={0}", a);

	auto app = Suyou::CreateApplication();
	app->Run();
	delete app;
}

#endif // SY_PLATFORM_WINDOWS
