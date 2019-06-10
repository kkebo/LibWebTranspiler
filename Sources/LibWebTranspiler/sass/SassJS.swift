//
//  SassJS.swift
//  cs2js
//
//  Created by 久保健太 on 10/10/15.
//  Copyright © 2015 Kenta Kubo. All rights reserved.
//

import Foundation
import libsass

struct SassCompiler: Compiler {
	static let instance = SassCompiler()

	func compile(code: String, options: [String: Any]? = nil) throws -> String {
		return try code.withCString { cstr -> String in
            let inputString = UnsafeMutablePointer<Int8>.allocate(capacity: code.count)
            inputString.initialize(from: cstr, count: code.count)
			let dataContext = sass_make_data_context(inputString)
			let context = sass_data_context_get_context(dataContext)
			let status = sass_compile_data_context(dataContext)
			if status == 0 {
				if let outputCString = sass_context_get_output_string(context) {
					return String(cString: outputCString)
				} else {
					throw CompileError.Unknown("Compilation was succeeded but getting output string was failed")
				}
			} else {
				if let outputCString = sass_context_get_error_message(context) {
					throw CompileError.Unknown(String(cString: outputCString))
				} else {
					throw CompileError.Unknown("Unknown Error")
				}
			}
		}
	}
}
