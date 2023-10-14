#include <Suyou.h>

class Sandox : public Suyou::Application
{
	public:
		Sandox() {

		}
		~Sandox()
		{

		}
};

Suyou::Application* Suyou::CreateApplication()
{
	return new Sandox();
}



