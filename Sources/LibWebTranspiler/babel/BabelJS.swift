//
//  BabelJS.swift
//  cs2js
//
//  Created by Kenta Kubo on 3/29/16.
//  Copyright © 2016 Kenta Kubo. All rights reserved.
//

import JavaScriptCore

public struct Babel: JSCompiler {
    public static let instance = Babel()
	public let context: JSContext = {
		let ctx: JSContext = JSContext()

		do {
			let str = try String(contentsOfFile: Bundle.main.path(forResource: "babel.min", ofType: "js")!, encoding: .utf8)
			ctx.evaluateScript(str)
		} catch {
		}

		return ctx
	}()

	public func compile(code: String, options: [String: Any]? = nil) throws -> String {
		var options = options
		options?["presets"] = ["es2015"]
		
		let result: JSValue = context.objectForKeyedSubscript("Babel").invokeMethod("transform", withArguments: [code, options ?? [:]])
		
		if result.isUndefined {
			throw CompileError.Unknown("Unknown Error")
		}
		
		return result.objectForKeyedSubscript("code").description
	}
}
