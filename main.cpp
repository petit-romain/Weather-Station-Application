#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "informations.h"
#include "request.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    Request * req = new Request();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("informations", req->getInformations());
    engine.load(QUrl("qrc:/main.qml"));

    return app.exec();
}
