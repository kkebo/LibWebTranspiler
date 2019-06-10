//
//  Compiler.swift
//  cs2js
//
//  Created by Kenta Kubo on 10/8/15.
//  Copyright (c) 2015 Kenta Kubo. All rights reserved.
//

import JavaScriptCore

enum CompileError: Error {
	case Unknown(String)
}

protocol Compiler {
	static var instance: Self { get }

	func compile(code: String, options: [String: Any]?) throws -> String
}

protocol JSCompiler: Compiler {
	var context: JSContext { get }
}
