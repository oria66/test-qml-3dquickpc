import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick3D 1.15
import QtQuick3D.Helpers 1.15

import Example 1.0

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Stack")

    View3D {
        anchors.fill: parent
        environment: SceneEnvironment {
            lightProbe: Texture{
                source: "imageTesto.hdr"
            }
            backgroundMode: SceneEnvironment.SkyBox
        }

        PerspectiveCamera {
            id: camera
            z: 300
        }

        DirectionalLight {
            eulerRotation.x: -30
        }

        Model {
            geometry: CustomGeometry{
                name: "mypointcloud"
                count: 10000000
            }
            materials: PrincipledMaterial{
            }
        }
    }

    WasdController{
        controlledObject: camera
    }
}
