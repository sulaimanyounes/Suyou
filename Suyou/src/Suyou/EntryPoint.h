#pragma once

#ifdef SY_PLATFORM_WINDOWS

extern Suyou::Application* Suyou::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Suyou::CreateApplication();
	app->Run();
	delete app;
}

#endif // SY_PLATFORM_WINDOWS
