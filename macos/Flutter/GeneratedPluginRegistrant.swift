//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import open_file_mac
import path_provider_foundation
import screen_retriever
import sqflite
import window_manager

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  OpenFilePlugin.register(with: registry.registrar(forPlugin: "OpenFilePlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  ScreenRetrieverPlugin.register(with: registry.registrar(forPlugin: "ScreenRetrieverPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
  WindowManagerPlugin.register(with: registry.registrar(forPlugin: "WindowManagerPlugin"))
}
