#include "qdeclarativecamera_plugin.h"

#include <qqml.h>

#include "qdeclarativecamera_p.h"
#include "qdeclarativecameracapture_p.h"
#include "qdeclarativecameraexposure_p.h"
#include "qdeclarativecamerafocus_p.h"
#include "qdeclarativecameraflash_p.h"
#include "qdeclarativecameraviewfinder_p.h"
#include "qdeclarativecameraimageprocessing_p.h"
#include "qdeclarativecamerapreviewprovider_p.h"

void QDeclarativeCameraPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<QDeclarativeCamera>(uri, 5, 0, "QCamera");

    qmlRegisterUncreatableType<QDeclarativeCameraCapture>(uri, 5, 0, "QCameraCapture",
                            tr("QCameraCapture is provided by Camera"));
    qmlRegisterUncreatableType<QDeclarativeCameraRecorder>(uri, 5, 0, "QCameraRecorder",
                            tr("QCameraRecorder is provided by Camera"));
    qmlRegisterUncreatableType<QDeclarativeCameraExposure>(uri, 5, 0, "QCameraExposure",
                            tr("QCameraExposure is provided by Camera"));
    qmlRegisterUncreatableType<QDeclarativeCameraFocus>(uri, 5, 0, "QCameraFocus",
                            tr("QCameraFocus is provided by Camera"));
    qmlRegisterUncreatableType<QDeclarativeCameraFlash>(uri, 5, 0, "QCameraFlash",
                            tr("QCameraFlash is provided by Camera"));
    qmlRegisterUncreatableType<QDeclarativeCameraImageProcessing>(uri, 5, 0, "QCameraImageProcessing",
                            tr("QCameraImageProcessing is provided by Camera"));
    qmlRegisterUncreatableType<QDeclarativeCameraViewfinder>(uri, 5, 4, "QCameraViewfinder",
                            tr("QCameraViewfinder is provided by Camera"));
}
