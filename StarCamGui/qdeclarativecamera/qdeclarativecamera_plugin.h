#ifndef QDECLARATIVECAMERAPLUGIN_H
#define QDECLARATIVECAMERAPLUGIN_H

#include <QQmlExtensionPlugin>

class QDeclarativeCameraPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.hwintjen.qdeclarativecamera")

public:
    void registerTypes(const char *uri);
};


#endif
