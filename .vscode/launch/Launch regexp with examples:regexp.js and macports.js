#!/usr/bin/env node
	;				var								parser			=		require(												process.argv[2])
	;if(																															process.argv[4]
		)	Object.assign(							parser.yy,JSON	.parse(	require('fs').readFileSync(require('path').normalize(	process.argv[4]))))
	;				var			result		=		parser			.parse(	require('fs').readFileSync(require('path').normalize(	process.argv[3]),'utf8'))
	;process.stdout.write(	result.toString(10,	parser.yy||{}))