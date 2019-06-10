//
//  coffeeScriptJs.swift
//  cs2js
//
//  Created by Kenta Kubo on 4/11/15.
//  Copyright (c) 2015 Kenta Kubo. All rights reserved.
//

import JavaScriptCore

struct CoffeeScriptCompiler: JSCompiler {
	static let instance = CoffeeScriptCompiler()
	let context: JSContext = {
		let ctx: JSContext = JSContext()

		do {
			let str = try String(contentsOfFile: Bundle.main.path(forResource: "coffeescript", ofType: "js")!, encoding: .utf8)
			ctx.evaluateScript(str)
		} catch {
		}

		return ctx
	}()

	func compile(code: String, options: [String: Any]? = nil) throws -> String {
		let result: JSValue = context.objectForKeyedSubscript("CoffeeScript").invokeMethod("compile", withArguments: [code, options ?? [:]])

		if result.isUndefined {
			throw CompileError.Unknown(context.exception.description)
		}

		return result.description
	}

	func compileAsLiterate(code: String, options: [String: Any]? = nil) throws -> String {
		var options = options
		options?["literate"] = true
		return try compile(code: code, options: options)
	}
}
