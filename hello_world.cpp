#include <Wt/WApplication.h>
#include <Wt/WEnvironment.h>
#include <Wt/WText.h>

class HelloWorldApp : public Wt::WApplication {
public:
    HelloWorldApp(const Wt::WEnvironment& env)
        : Wt::WApplication(env) {
        setTitle("Hello, World!"); // Установить заголовок
        root()->addWidget(std::make_unique<Wt::WText>("Hello, World!"));
    }
};

std::unique_ptr<Wt::WApplication> createApplication(const Wt::WEnvironment& env) {
    return std::make_unique<HelloWorldApp>(env);
}

int main(int argc, char** argv) {
    return Wt::WRun(argc, argv, &createApplication);
}
