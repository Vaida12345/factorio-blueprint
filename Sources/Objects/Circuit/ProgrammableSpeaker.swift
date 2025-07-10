//
//  ProgrammableSpeaker.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import DetailedDescription


public enum ProgrammableSpeaker {
    
    public struct Parameters: Codable, Equatable {
        
        /// Volume of the speaker.
        public var playback_volume: Double
        
        /// whether global playback is enabled.
        public var playback_globally: Bool
        
        /// whether polyphony is allowed.
        public var allow_polyphony: Bool
        
        
        public init(playback_volume: Double, playback_globally: Bool, allow_polyphony: Bool) {
            self.playback_volume = playback_volume
            self.playback_globally = playback_globally
            self.allow_polyphony = allow_polyphony
        }
        
    }
    
    public struct AlertParameter: Codable, Equatable {
        
        /// whether an alert is shown.
        public var showAlert: Bool
        
        /// whether an alert icon is shown on the map.
        public var showOnMap: Bool
        
        /// The icon that is displayed with the alert
        public var icon: SignalID
        
        ///  message of the alert.
        public var message: String
        
        
        public init(showAlert: Bool, showOnMap: Bool, icon: SignalID, message: String) {
            self.showAlert = showAlert
            self.showOnMap = showOnMap
            self.icon = icon
            self.message = message
        }
        
        enum CodingKeys: String, CodingKey {
            case showAlert = "show_alert"
            case showOnMap = "show_on_map"
            case icon = "icon_signal_id"
            case message = "alert_message"
        }
        
    }
    
    public struct CircuitParameters: Codable, Equatable {
        
        public var signal_value_is_pitch: Bool
        
        public var stop_playing_sounds: Bool
        
        public var instrument_id: Int
        
        public var note_id: Int
        
        
        public init(signal_value_is_pitch: Bool, stop_playing_sounds: Bool, instrument_id: Int, note_id: Int) {
            self.signal_value_is_pitch = signal_value_is_pitch
            self.stop_playing_sounds = stop_playing_sounds
            self.instrument_id = instrument_id
            self.note_id = note_id
        }
        
    }
}


extension ProgrammableSpeaker.Parameters: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<ProgrammableSpeaker.Parameters>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.playback_volume)
            descriptor.value(for: \.playback_globally)
            descriptor.value(for: \.allow_polyphony)
        }
    }
}


extension ProgrammableSpeaker.AlertParameter: DetailedStringConvertible {
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<ProgrammableSpeaker.AlertParameter>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.icon)
            descriptor.value(for: \.message)
            descriptor.value(for: \.showAlert)
            descriptor.value(for: \.showOnMap)
        }
    }
}


extension ProgrammableSpeaker.CircuitParameters: DetailedStringConvertible {
    
    
    public func detailedDescription(using descriptor: DetailedDescription.Descriptor<ProgrammableSpeaker.CircuitParameters>) -> any DescriptionBlockProtocol {
        descriptor.container {
            descriptor.value(for: \.instrument_id)
            descriptor.value(for: \.note_id)
            descriptor.value(for: \.signal_value_is_pitch)
            descriptor.value(for: \.stop_playing_sounds)
        }
    }
}
