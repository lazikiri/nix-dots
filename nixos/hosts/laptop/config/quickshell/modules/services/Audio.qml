pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    readonly property int volumeLevel: {
        const level = Pipewire.defaultAudioSink.audio.volume;
        return Math.round(level * 100);
    }
}
