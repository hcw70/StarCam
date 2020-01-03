#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QuickFlux>

#include <QtMultimedia/QCamera>

#include <QQmlEngine>
#include <QQmlComponent>

#include "qdeclarativecamera/qdeclarativecamera_plugin.h"

void initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(uri);
//    engine->addImageProvider("camera", new QDeclarativeCameraPreviewProvider);
}


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QDeclarativeCameraPlugin p;
    p.registerTypes("org.hwintjen");

    registerQuickFluxQmlTypes();

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    QObject::connect(view.engine(), &QQmlEngine::quit,
                     qApp, &QGuiApplication::quit);

    view.setSource(QUrl("qrc:///StarCam.qml"));
    view.resize(800, 480);
    view.show();
    return app.exec();
}
