//
//  TypeScriptJS.swift
//  cs2js
//
//  Created by Kenta Kubo on 3/29/16.
//  Copyright © 2016 Kenta Kubo. All rights reserved.
//

import JavaScriptCore

struct TypeScriptCompiler: JSCompiler {
	static let instance = TypeScriptCompiler()
	let context: JSContext = {
		let ctx: JSContext = JSContext()

		do {
			let str = try String(contentsOfFile: Bundle.main.path(forResource: "typescriptServices", ofType: "js")!, encoding: .utf8)
			ctx.evaluateScript(str)
		} catch {
		}

		return ctx
	}()

	func compile(code: String, options: [String: Any]? = nil) -> String {
		return context.objectForKeyedSubscript("ts").invokeMethod("transpile", withArguments: [code, options ?? [:]]).description
	}
}
