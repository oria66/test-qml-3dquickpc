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
            materials: PrincipledMaterial{}
        }
    }

//    View3D {
//        anchors.fill: parent
//        camera: camera

//        PerspectiveCamera {
//            id: camera
//            position: Qt.vector3d(0, 0, 600)
//        }

//        DirectionalLight {
//            position: Qt.vector3d(-500, 500, -100)
//            color: Qt.rgba(0.4, 0.2, 0.6, 1.0)
//            ambientColor: Qt.rgba(0.1, 0.1, 0.1, 1.0)
//        }

//        Model {
//            scale: Qt.vector3d(100, 100, 100)
//            geometry: GridGeometry {
//                horizontalLines: 20
//                verticalLines: 20
//            }
//            materials: [ DefaultMaterial { } ]
//        }
//    }

    WasdController{
        controlledObject: camera
    }
}
