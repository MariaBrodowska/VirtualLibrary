import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: control

    implicitWidth: Math.max(
                       buttonBackground ? buttonBackground.implicitWidth : 0,
                       textItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        buttonBackground ? buttonBackground.implicitHeight : 0,
                        textItem.implicitHeight + topPadding + bottomPadding)
    leftPadding: 4
    Rectangle {
        id: buttonBackground
        color: "#00000000"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 2
        border.color: "#047eff"
    }

    Text {
        id: textItem
        text: control.text

        opacity: enabled ? 1.0 : 0.3
        color: "#047eff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    states: [
        State {
            name: "down"
            when: !control.down

            PropertyChanges {
                target: buttonBackground
                width: 300
                height: 150
                color: "#000000"
                border.color: "#000000"
            }

            PropertyChanges {
                target: textItem
                width: 300
                height: 100
                color: "#9048cf"
                text: "My Button"
                font.pointSize: 34
            }

            PropertyChanges {
                target: control
                width: 300
                height: 150
                font.pointSize: 34
                highlighted: false
            }
        },
        State {
            name: "normal"
            PropertyChanges {
                target: buttonBackground
                width: 300
                height: 150
                color: "#6d28a4"
                border.color: "#6d28a4"
            }

            PropertyChanges {
                target: textItem
                width: 300
                height: 100
                color: "#000000"
                text: "My Button"
                font.pointSize: 34
            }

            PropertyChanges {
                target: control
                width: 300
                height: 150
                highlighted: false
                font.pointSize: 34
            }
        }
    ]
}
