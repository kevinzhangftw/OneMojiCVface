//
//  enum Emoji.swift
//  Facial
//
//  Created by June Kim on 2017-04-04.
//  Copyright © 2017 Soulcast. All rights reserved.
//

import Foundation

enum Emoji: String {
  case rbs = "😑"
  case neutral = "😐"
  case slightSmile = "🙂"
  case eyesClosedSmile = "☺️"
  case openMouthSmile = "😃"
  case eyesClosedOpenMouthSmile = "😆"
  case winky = "😉"
  case oneEyeKissy = "😘"
  case eyesClosedKissy = "😚"
  case eyesOpenKissy = "😗"
  case eyesOpenFrown = "🙁"
  case eyesClosedFrown = "😞"
  case mouthOpenFrown = "😨"
  case null = ""
}

enum MouthPosition: Int {
  case neutral = 0
  case slightSmile = 1
  case openSmile = 2
  case kissy = 3
  case frown = 4
  case unknown = -1
}

enum EyePosition {
  case bothOpen
  case bothClosed
  case openClosed
  case unknown
}

struct EmojiTranslation {
  static func mouthPosition(from emoji:Emoji) -> MouthPosition {
    switch emoji {
    case .rbs: return .neutral
    case .neutral: return .neutral
    case .slightSmile: return .slightSmile
    case .eyesClosedSmile: return .slightSmile
    case .winky: return .slightSmile
    case .openMouthSmile: return .openSmile
    case .eyesClosedOpenMouthSmile: return .openSmile
    case .oneEyeKissy: return .kissy
    case .eyesClosedKissy: return .kissy
    case .eyesOpenKissy: return .kissy
    case .eyesOpenFrown: return .frown
    case .eyesClosedFrown: return .frown
    case .mouthOpenFrown: return .frown
    default: assert(false); break
    }
  }
  static func eyePosition(from emoji:Emoji) -> EyePosition {
    switch emoji {
    case .rbs: return .bothClosed
    case .neutral: return .bothOpen
    case .slightSmile: return .bothOpen
    case .eyesClosedSmile: return .bothClosed
    case .winky: return .openClosed
    case .openMouthSmile: return .bothOpen
    case .eyesClosedOpenMouthSmile: return .bothClosed
    case .oneEyeKissy: return .openClosed
    case .eyesClosedKissy: return .openClosed
    case .eyesOpenKissy: return .bothOpen
    case .eyesOpenFrown: return .bothOpen
    case .eyesClosedFrown: return .bothClosed
    case .mouthOpenFrown: return .bothOpen
    default: assert(false); break
    }
  }
  static func emoji(from mouthPosition:MouthPosition, eyePosition: EyePosition) -> Emoji {
    switch eyePosition {
    case .bothOpen:
      switch mouthPosition {
      case .neutral: return .neutral
      case .slightSmile: return .slightSmile
      case .openSmile: return .openMouthSmile
      case .kissy: return .eyesOpenKissy
      case .frown: return .eyesOpenFrown
      default: assert(false); break
      }
    case .bothClosed:
      switch mouthPosition {
      case .neutral: return .rbs
      case .slightSmile: return .eyesClosedSmile
      case .openSmile: return .eyesClosedOpenMouthSmile
      case .kissy: return .eyesClosedKissy
      case .frown: return .eyesClosedFrown
      default: assert(false); break
      }
    case .openClosed:
      switch mouthPosition {
      case .neutral: return .winky
      case .slightSmile: return .winky
      case .openSmile: return .winky
      case .kissy: return .oneEyeKissy
      case .frown: return .null
      default: assert(false); break
      }
    default: assert(false); break
    }
  }
  static func nextEmoji(from emoji:Emoji) -> Emoji {
    switch emoji {
    case .rbs: return .neutral
    case .neutral: return .slightSmile
    case .slightSmile: return .eyesClosedSmile
    case .eyesClosedSmile: return .winky
    case .winky: return .openMouthSmile
    case .openMouthSmile: return .eyesClosedOpenMouthSmile
    case .eyesClosedOpenMouthSmile: return .oneEyeKissy
    case .oneEyeKissy: return .eyesClosedKissy
    case .eyesClosedKissy: return .eyesOpenKissy
    case .eyesOpenKissy: return .eyesOpenFrown
    case .eyesOpenFrown: return .eyesClosedFrown
    case .eyesClosedFrown: return .mouthOpenFrown
    case .mouthOpenFrown: return .rbs
    default: assert(false); break
    }
  }
}

















