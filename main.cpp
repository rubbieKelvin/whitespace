#include "qtstatusbar/src/statusbar.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[]){
    
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterType<StatusBar>("StatusBar", 0, 1, "StatusBar");
    
    const QUrl url(QStringLiteral("qrc:/uix/main.qml"));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    
    engine.load(url);
    return app.exec();
}
