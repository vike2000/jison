#!/usr/bin/env node
	;				pgm
	=				new(require('commander').Command)
	;				pgm
	.		  argument(						'[<' + 'file'		+'>]'	,'File containing a grammar'													)
	.		  argument(						'[<' + 'lexfile'	+'>]'	,'File containing a lexical grammar'											) //cspell:ignore lexfile
	.			option('-j, --json'										,'Force jison to expect a grammar in JSON format'					,false		) //cspell:ignore jison
	.			option('-t, --debug'									,'Debug mode'														,false		)
	.			option('-m, --module-type <type>'						,'The type of module to generate (commonjs, amd, js)'				,'commonjs'	)
	.			option('-p, --parser-type <type>'						,'The type of algorithm to use for the parser (lr0, slr, lalr, lr)'	,'lalr'		) //cspell:ignore lalr
	.			option('-o, --outfile <path>'							,'Filename and base module name of the generated parser'						) //cspell:ignore outfile
	;				pgm									.parse()
	;				var	opts
	=				pgm.opts()
	
	;		function	processGrammar(input)
		{			var	grammar
		=	(			opts							.json
			?			require('cjson'				)
			:			require('ebnf-parser'		))	.parse
			(			input)
		
		;if (		pgm.args[1]
			)			grammar	.lex
			=			require('lex-parser'		)	.parse
			  (			require('fs'				)	.readFileSync
				(		require('path'				)	.normalize
				  (	pgm.args[1]),									'utf8'))
		
		;				grammar.options
		=				grammar.options||{}
		
		;if(			opts							.moduleName
			)			grammar.options					.moduleName
			=			opts							.moduleName
		;				grammar.options					.moduleType
		=				opts							.moduleType
		;				grammar.options					.	   type
		=				opts							.parserType
		;				grammar	.options				.debug
		=				opts							.debug
		
		;			var									 basename
		;if(!			opts							.moduleName
		 &&	(											 basename
			=			opts							.outfile
			||			opts							.file)
		 &&	(											 basename
			=			require('path'				)	.basename
				(										 basename)
			.											 replace(/\..*$/, ''))
		 )				opts							.moduleName
		 =												 basename
		 .												 replace(/-(\w)/g
		  ,	function(	$0,	$1)
		   {return			$1						.toUpperCase()})
		
		;			var	out
		;switch(		opts.moduleType.replace(/^export-|-(body|no-Parser)$/g,''))
			{case 'js-product'
			:case 'js-factory'
			:case 'js-global'
				:		out
				= (new(	require('../lib/jison.js'	)	.Generator)
					  (	grammar
					  ,	grammar	.options))				.generateModuleExpr()}
		;switch(		opts.moduleType.replace(/^export-|-(body|no-Parser)$/g,''))
			{case 'js-product'
			:case 'js-factory'
			:case 'js-global'
				:		out
				=		out								.replace(/;$/g,'')
			 break}
		;switch(		opts.moduleType.replace(/^export-|-(body|no-Parser)$/g,''))
			{case 'js-factory'
			:case 'js-global'
				:		out
				=		out								.replace(/\(\)$/g,'')
			 break}
		;var					stripLines=[]
		;switch(		opts.moduleType.replace(/^export-/,''))
			{case 'js-factory-body'
			:case 'js-global'
			:case 'js-global-no-Parser'
				:				stripLines.push(														  ['(function(){'										,-1])
			 break}
		;switch(		opts.moduleType.replace(/^export-/,''))
			{case 'js-global-no-Parser'
				:				stripLines.push(														  ['function Parser () {'								, 1]
					,																					  ['  this.yy = {};'									, 1]
					,																					  ['}'													, 1]
					,																					  ['Parser.prototype = parser;parser.Parser = Parser;'	, 1])
			 break}
		;switch(		opts.moduleType.replace(/^export-/,''))
			{case 'js-global'
			:case 'js-global-no-Parser'
				:				stripLines.push(														  ['return new Parser;'									, 1])
			 break}
		;switch(		opts.moduleType.replace(/^export-/,''))
			{case 'js-factory-body'
			:case 'js-global'
			:case 'js-global-no-Parser'
				:				stripLines.push(														  ['})'													, 1])
			 break}
		;if(					stripLines.length)
			{					stripLines
			=					stripLines.reduce(function(	m,	line)
					{											line[0]
					=											line[0].replace(/[$(\[\]|.)*?{+}^]/g,'\\$&')
					;		if(									line[1]<=-1)
						{	if(!							m[	line[1]]
							)								m[	line[1]]=[]
						;									m[	line[1]].push
							(						'^'		+	line[0]
							+'(\r\n|\r|\n)')}
					 else	if(									line[1]== 0)
						{	if(!							m[	line[1]]
							)								m[	line[1]]=[]
						;									m[	line[1]].push
							(									line[0]
							+'(\r\n|\r|\n)'+		'|'
							+'(\r\n|\r|\n)'					+	line[0])}
					 else	if(									line[1]>= 1)
						{	if(!							m[	line[1]]
							)								m[	line[1]]=[]
						;									m[	line[1]].unshift
							('(\r\n|\r|\n)'					+	line[0]
							+						'$')}
					return									m}
				,	{})
			;		out
			=		[].concat(	stripLines[-1]||[]
					,			stripLines[ 0]||[]
					,			stripLines[ 1]||[])
			.reduce(function(								m,	line)
				  {	return									m
					.replace(new RegExp(						line),'')}
				,	out)}
		;switch(		opts.moduleType.replace(/^export-|-(body|no-Parser)$/g,''))
			{case 'js-product'
			:case 'js-factory'
			:case 'js-global'
			:break
			
			;default
				:		out
				= (new(	require('../lib/jison.js'	)	.Generator)
					  (	grammar
					  ,	grammar	.options))				.generate
				  (		grammar	.options)}
		
		;		if(		opts.moduleType.match(/^export-named-/)
			)			out
			='module.exports'
			+  '.'
			+			opts							.moduleName
			+ ' = '
			+			out
		;else	if(		opts.moduleType.match(/^export-/)
			)			out
			='module.exports'
			+ ' = '
			+			out
		
		;if(			opts							.outfile
			)			require('fs'				)	.writeFileSync
			(			opts							.outfile
			,			out)
		;else			process.stdout					.write
			(			out,										'utf8')
		;}
	
	;if(			pgm.args[0])
		{			var	input
		=				require('fs'				)	.readFileSync
			(			require('path'				)	.normalize
				(	pgm.args[0]						),				'utf8')
		;				opts.json
		||='.json'==	require('path'				)	.extname
			(		pgm.args[0])
		;				processGrammar
			(			input)
		;}
	 else{			var	stdin
		=process.	openStdin()
		;			var	input=''
		;				stdin.setEncoding(							'utf8')
		;				stdin.addListener('data',function(	chunk	)
		  {				input+=								chunk	})
		;				stdin.addListener('end'	,function(			)
		  {				processGrammar
			(			input)})}
	
