#include "qtstatusbar/src/statusbar.h"
#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "includes/xtorage.h"

int main(int argc, char *argv[]){
    
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    Xtorage xtorage;

    xtorage.key = 17;
    xtorage.filename = QStringLiteral("whitespace.crypt");

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

    engine.rootContext()->setContextProperty(QStringLiteral("xtorage"), &xtorage);
    
    engine.load(url);
    return app.exec();
}
