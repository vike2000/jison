//cspell:ignore metachar
/*
: bash :&&(cd /∂/git/jison &&: "cuttable external deps on ~vike/.bash_profile (vpath vbash base) and ~vike/shell (resp.): _vnq and tiedye.awk; replaceable external dep on colordiff: last if((entities_are_calls)) with content of ´then´; s/min=1/min=0/ to disable uglifyjs" //cspell:ignore jison metachars uglifyjs colordiff tiedye :&& min=1 && export conflict_handling=cat && for permute in 0 1;do for entities_are_calls in 1 0;do for empty_class_opens in 1 $(((entities_are_calls))||echo 0);do export empty_class_opens && .vscode/tasks/"Create regexp.input".sh && _vnq_color=magenta _vnq permute=$permute permutations_use_metachars=$((0&&!entities_are_calls)) entities_are_calls=$entities_are_calls calls_use_metachars=0 empty_class_opens=$empty_class_opens .vscode/tasks/"Create regexp.json".sh && require_bluelephant_excerpt=1 uglifyjs=$min .vscode/tasks/"Build .vscode:tmp:regexp.js with examples:regexp.js and macports".sh && output+=("$(.vscode/launch/"Launch regexp with examples:regexp.js and macports".js ../tmp/regexp$(((!min))||echo .min).js .vscode/tmp/regexp.input .vscode/tmp/regexp.json|(((!entities_are_calls))&&cat||tiedye.awk -- -l))")||break 3; if((entities_are_calls));then printf %s\\n "${output[${#output[@]}-1]}" ;else ((((permute))||colordiff -u --label "input" --label "output" <(cat .vscode/tmp/regexp.input;echo) <(printf %s\\n "${output[${#output[@]}-1]}")) && (((!permute||empty_class_opens))||colordiff -u --label "previous output" --label "current output" <(printf %s\\n "${output[${#output[@]}-2]}") <(printf %s\\n "${output[${#output[@]}-1]}"))) && printf %s\\n "${output[${#output[@]}-1]}" ;fi ;unset conflict_handling ;done;done;done)
: bash :&&(cd /∂/git/jison &&: "cuttable external deps on ~vike/.bash_profile (vpath vbash base) and ~vike/shell (resp.): _vct and last two (((!min))||…); uglyfyjs can be cut in the same way and all min can be disabled by substituting min=1 with min=0 next; also gsed is linux sed via macports" //cspell:ignore jison uglyfyjs tiedye :&& min=1 && module_type=js-global-no-Parser .vscode/tasks/"Build .vscode:tmp:regexp.js with examples:regexp.js and macports".sh && out=.vscode/tmp/regexp.js && gsed -i -E -e '/(.slice.call)\((arguments), 1\)/s//\1(\2, 2)/' -e '/(sharedState) = \{ (yy): \{\} \}/s//\1 = {\2: arguments[1]||{}}/' "$out" && (((!min))||uglifyjs -m --keep-fnames --source-map "includeSources=true" -o .vscode/tmp/regexp.min.js "$out") && for f in .vscode/tmp/regexp.js $(((!min))||echo .vscode/tmp/regexp.min.js);do gsed -i -E -e $'1s/^/'$'_.extend(function VRE(_yy_\t){this.yy=_yy_||{}},{prototype:(function(){/' -e $'$s/$/return parser})()})/' "$f";done && _vct less "$out" && (((!min))||(gsed -i -E -e '/\b(var parser|function m|function permute|function a|var lexer)\b/s//\n\t\t\t\t\t\t\t\t\t&/g' -e '/,(performAction|table|defaultActions|more|showPosition|next|performAction|rules|conditions):/s//\n\t\t\t\t\t\t\t\t\t\t&/g' .vscode/tmp/regexp.min.js)) && (((!min))||_vct tiedye_less -X -- -- -- -j $(: -w $((COLUMNS-16)) :) .vscode/tmp/regexp.min.js) && (((!min))||_vp pbcopy < .vscode/tmp/regexp.min.js))
*/

%lex

%s s_class
%s s_count
%s s_escape

%%

<INITIAL><<EOF>>					return 'EOF'
<INITIAL,s_class>"\\"				%{
									this.begin('s_escape')
									return 'ESCAPE'
									%}
<s_escape>.						%{
									this.popState()
									return 'ESCAPED'
									%}
<INITIAL>"^"						return 'BOS'
<INITIAL>":"						return 'COLON'
<INITIAL>"(?"						return 'NON_CAPTURING_GROUP_OPEN'
<INITIAL>"("						return 'CAPTURING_GROUP_OPEN'
<INITIAL>")"						return 'GROUP_CLOSE'
<s_class>"[:"						return 'MEMBER_POSIX_OPEN'
<s_class>"[."						return 'MEMBER_COLLATING_OPEN'
<s_class>"[="						return 'MEMBER_EQUIVALENCE_OPEN'
<s_class>"=]"						return 'MEMBER_EQUIVALENCE_CLOSE'
<s_class>".]"						return 'MEMBER_COLLATING_CLOSE'
<s_class>":]"						return 'MEMBER_POSIX_CLOSE'
<s_class>"-"						return 'MEMBER_DASH'
<s_class>[^\]\\]					return 'MEMBER_CHAR'
<INITIAL>"[^]"						%{
									if(yy.empty_class_opens
										)this.begin('s_class')
									return 'NEGATIVE_CLASS_OPEN_WITH_CLOSE'
									%}
<INITIAL>"[]"						%{
									if(yy.empty_class_opens
										)this.begin('s_class')
									return 'POSITIVE_CLASS_OPEN_WITH_CLOSE'
									%}
<INITIAL>"[^"						%{
									this.begin('s_class')
									return 'NEGATIVE_CLASS_OPEN'
									%}
<INITIAL>"["						%{
									this.begin('s_class')
									return 'POSITIVE_CLASS_OPEN'
									%}
<s_class>"]"						%{
									this.popState()
									return 'CLASS_CLOSE'
									%}
<INITIAL>"{"						%{
									this.begin('s_count')
									return 'COUNT_OPEN'
									%}
<s_count>[0-9]+						return 'COUNT_NUMBER'
<s_count>","						return 'COUNT_COMMA'
<s_count>"}"						%{
									this.popState()
									return 'COUNT_CLOSE'
									%}
<INITIAL>"."						return 'DOT'
<INITIAL>"*"						return 'STAR'
<INITIAL>"?"						return 'OPT'
<INITIAL>"+"						return 'PLUS'
<INITIAL>"|"						return 'PIPE'
<INITIAL>"$"						return 'EOS'
<INITIAL>[^^(?:.*|\[+){$\\]+		return 'STRING'

/lex

%{
	//cspell:ignore higginstr
	;								function																										m
		(																																		yy,								v)	// metachar
		{							return																									  c(yy,'meta'				,		v)}
	;								function																								  c								// class (from higgins), call, command, container
		(													yy,						name,	piece___)
		{return						$b.					 make									.apply
		  (														this
		  ,	[ (													arguments.callee																.s // storage
			  ||(												arguments.callee																.s={}))
			  [																		name]
			||(													arguments.callee																.s
				[																	name]
			  =						$b.				 higginstr
				(					$b.					oprot(						{} //cspell:ignore oprot
				 ,												arguments.callee																.p // prototype
				 ||(											arguments.callee																.p
				   =				$b.					proto(						[] // inline js support seems only partial - no intellisense and (albeit pos. separate issue) cspell doesn't see it - in cruzelante098.jison-syntax-highlight: cspell:ignore cruzelante proto
					, {							toString // $b.methodize requires too much of bluelephant_excerpt and this is simple enough
					  :				function	toString(a0,yy)
						{		if(						!	yy
							)								yy
							=									this
							.								yy
						;		if(						!	yy.																						entities_are_calls
						  )			return						this						.reduce
							(		function(		m,										piece)
							  {if(							yy.																						permute
								&&						!	yy.																						permutations_use_metachars
								&&															piece	.constructor==							  c	.s.	meta
								)	return			m
							  ;						m.push
							  (																piece
							  .					toString(a0,yy))
							  ;		return			m},								[]	)	.join	(		''		)
						;else		return						this .constructor.	name
						  +'('+									this						.reduce
							(		function(		m,										piece)
							  {if(							yy.																						entities_are_calls
								&&						!	yy.																						calls_use_metachars
								&&															piece	.constructor==							  c	.s.	meta
								)	return			m
							  ;						m.push
								(				 'string'	==	typeof						piece
								?'"'+														piece
								.															 replace(/[\\"]/g,'\\$&')+'"'
								:															piece
								.				toString(a0,yy))
							  ;		return			m},								[]	)	.join	(	   ', '		)+')'}})))
				,																	name
				,					function(					that
				  ,											yy,								piece___)
				  {Object.defineProperty(						this
					,									   'yy',{enumerable:false,value
						:									yy})
				  ;												this .splice									.apply
					(											this,[0,0]															.concat([].slice.call(arguments,2)))}
				, [					]))
			,												yy																	]	.concat([].slice.call(arguments,2)))}
	
	;								function																										permute
		(													yy,																						permutational)
		{if(											!	yy.																						permute // (oaed origin: late Middle English (also in the sense ‘interchange’): from Latin *permutare* ‘change completely’, from *per-* ‘through, completely’ + *mutare* ‘to change’) as permutate is "regarded as a back-formation from permutation" according to oaed origin (late 19th century) -- cspell:ignore permutare, mutare, & permutate
			||											2>	yy.																						permute
			)						return																											permutational
		;							function																										f(							P,i)
			{		if(								(	i											.constructor==							  c	.s.	alternative)
				||									(	i											.constructor==							  c	.s.	permutations))
				{																P=	[].concat.apply
					(																[]
					,									i.	map(function		(A){return A		.constructor==							  c	.s.	meta?[]
							:																														f(JSON.parse(JSON.stringify(P)),A)})
					)}
			 else	if(		'object'	==	typeof		i
				)					for(var s=0;s<		i.length;s++)			P=																	f(							P,i[s])
			;else	if(!(								i											.constructor==							  c	.s.	meta) // porting to vre.php (bluelephant), this seems moot (`if(x is object);elseif(x instanceof meta)then do` would never `do`, right?)
				)					for(var q=0;q<		P.length;q++)			P[q].push(i)
			;						return																																		P}
		;var																	R								=									f(							[[]]
			,																																		permutational)
		;							return																											R
		.													map(function		(v)
			{return																(v)			.join('')})
		.																					 join("\n")}
	//lab @ bash: $ node -e $'(()=>{var seq=\'seq\',alt=\'alt\';function a(p){return {t:seq,c:[`${p}p`,{t:alt,c:[{t:seq,c:[`${p}a1p`,`${p}a1`,`${p}a1s`]},{t:seq,c:[`${p}a2p`,`${p}a2`,`${p}a2s`]}]},`${p}s`]}};var i={t:seq,c:["a0p",{t:alt,c:[a("a0a1"),a("a0a2")]},"a0s"]},P=[[]];function f(P,i){if(\'object\'!=typeof i)for(var p in P)P[p].push(i);else if(i.t==seq)for(var s in i.c)P=f(P,i.c[s]);else if(i.t==alt){P=[].concat.apply([],i.c.map(A=>f(JSON.parse(JSON.stringify(P)),A)))}return P};P=f(P,i);process.stdout.write(JSON.stringify(P))})()'|tiedye.awk -- -l
	
	// currently permute(yy,permutational) is a postprocessing where permutational is the result from the preprocessing p(yy,that)
	;								function																										p								// permutational (preprocessing)
		(													yy,	that)
		{if(											!	yy.																						permute							// (oaed origin: late Middle English (also in the sense ‘interchange’): from Latin *permutare* ‘change completely’, from *per-* ‘through, completely’ + *mutare* ‘to change’) as permutate is "regarded as a back-formation from permutation" according to oaed origin (late 19th century) -- cspell:ignore permutare, mutare, & permutate
			||				'string'	==	typeof				that
			)						return						that
		;							var																												permuter						//cspell:ignore permuter
		;		if(eval("\n\
							'undefined'	!=	typeof			\t"+that 								.constructor.name									 + "\n\
						&&	(																														permuter\n\
							=								\t"+that 								.constructor.name									 + "\n\
							)"))	return																											permuter
				(											yy,	that)
//			||													that
		 else for(					var										s=0 // `for(var s in [])throw true` doesn't throw but `for(var s in that)if(s=='length')throw true` here does
			;													that.length>s
			;																s++
			)													that[		s]
			=													arguments.callee
				(											yy,	that[		s])
		;							return						that}
	
	;								function																											a				(	yy,	P) // alternatives (permutations)
		{for(						var										s=0,																					R=[]	;	P
			.														 length>s
			;																s++)																										{if(	yy.permutations_use_metachars)if(!s)R.push(m(yy,'(?'),'',m(yy,':'));else R.push(m(yy,'|'))
			;																																											;if(	yy.permutations_use_metachars||!(P[s] instanceof c.s.meta))R.push(P[s])}
		;																																												;if(	yy.permutations_use_metachars)R.push(m(yy,')'))
		;																																												;return 1!=R.length?c.apply(this,[yy,'permutations'].concat(R)):R[0]}
	
	;								function																											u				(	yy,	i)		{return!(i .constructor== c.s.escaped)?i:eval('"\\'+i[1]+'"')} // unescape (instance)
	
	;								function																											escaped			(	yy,	i)		{return!yy.permutations_use_metachars?u(yy,i):i}
	;								function																											negative_class	(	yy,	i)		{for(var n=new RegExp(i.toString(0xa,{permute:false,entities_are_calls:false})),S=".?^!$~_",s=0;s<S.length;s++)if(S[s].match(n))break;return S[s]||"…"}
	;								function																											positive_class	(	yy,	i)		{var S={};return a(yy,i.slice(1,-1).reduce(function(m,v){var P=p(yy,v);if('object'==typeof P){for(var s=0;s<P.length;s++)if(~(!S[P[s]]?S[P[s]]=-1:--S[P[s]]))delete P[s];if(P.length)m.push(P)}else if(~(!S[P]?S[P]=-1:--S[P]));else m.push(P);return m},[]))} // that you have to init before increment to avoid the ever false ana (for the purpose i commonly use and call nf - not_first) in js is quite annoying (the same goes for notice on uninit'd vars which i guess will be made intentional cpu panic in php9 following the promoting of such notices in php8 compared to earlier vers) - rant will never stop
	;								function																											member_range	(	yy,	i)		{for(var P=[],	v=u(yy,i[0])[0].charCodeAt(0)
			,																																															l=u(yy,i[2])[0].charCodeAt(0);v<=l;v++)P.push(String.fromCodePoint(v));return a(yy,P)}
	;								function																											greedy			(	yy,	i)		{var P=[],l;switch(i[1].constructor) // `switch(true){case {a:{}}.a instanceof {a:{}}.b:a:{}}.a instanceof {a:{}}.c:}` throws TypeError ("Right-hand side of 'instanceof' is not an object") and is lengthier (than `switch({a:{}}.a.constructor){case {a:{}}.b:case {a:{}}.c:}`: a(c)=48+28*c > b(c)=44+14*c, for c ∈ ℕ) // in general: no instanceof cause-of: w/o parser.yy.permute permutations is undefined here (yet) // cspell:ignore instanceof
			{						case c.s.																											OPT								:l=[0,1]
			;break;					case c.s.																											STAR							:l=[0,null]
			;break;					case c.s.																											PLUS							:l=[1,null]
			;break;					case c.s.																											count
				:					case c.s.																										min_count							:l=i[1].filter(function(i){return!(i .constructor== c.s.meta)})}
		;																																												;if(l[0]===0)P.push('')
		;																																												;if(l[0]<l[1]||l[1]==null)	{for(var							S=[],s,r=					l[0]?l[0]:1	;--r>=0;){S.push(s||(s=p(yy,i[0])));r!=0||P.push(c.apply(this,[yy,'sequential'].concat(S)))}
			;																																																		;for(var n=yy.repeatable_count||3,	S=[],s,r=Math.min(n,null!=	l[1]?l[1]:n);--r>=0;){S.push(s||(s=p(yy,i[0])));r!=0||P.push(c.apply(this,[yy,'sequential'].concat(S)))}}
		;																																												;return a(yy,P)}
	;								var																												non_greedy
	=																																					greedy
	;								function																										non_capturing_group	(	yy,	i)		{return a(yy,i.slice(3,-1)	.map(function(v){return p(yy,v)}))}
	;								function																											capturing_group	(	yy,	i)		{return a(yy,i				.map(function(v){return p(yy,v)}))}
	//alternative
	//sequential
	//non_greedy
	//greedy
	//BOS
	//EOS
	//DOT
	//escaped
	//string
	//OPT
	//STAR
	//PLUS
	//count
	//min_count
	//count
	//capturing_group
	//non_capturing_group
	//escaped
	//MEMBER_CHAR
	//member_range
	//member_posix
	//member_collating
	//member_equivalence
	//members
	//negative_class
	//positive_class
	
	%}
	%start	pattern
	%%		pattern			:												pattern							EOF								{return	permute(yy
			,																																		p(		yy,																								$$								)	)	}
							|												alternative														{$$	=																											$1										}
							|												block															{$$	=																											$1										}
	;		alternative		:								block			PIPE			block											{$$ =	c(		yy,	'alternative'			,												$1	,		m(	yy,	$2)	,	$3							)	}
							|								alternative		PIPE			block											{$1	.push(																								m(	yy,	$2)	,	$3							)	}
	;		block			:												basic															{$$	=																											$1										}
							|												sequential														{$$	=																											$1										}
	;		sequential		:												basic			basic											{$$	=	c(		yy,	'sequential'			,												$1	,						$2							)	}
							|												sequential		basic											{$1	.push(																										$2									)	}
	;		basic			:												repeatable		repetition		OPT								{$$	=	c(		yy,	'non_greedy'			,												$1	,						$2,	m(	yy,	$3			)	)	}
							|												repeatable		repetition										{$$	=	c(		yy,		'greedy'			,												$1	,						$2							)	}
							|												repeatable														{$$	=																											$1										}
							|												anchor															{$$	=																											$1										}
	;		anchor			:												BOS																{$$	=	c(		yy,	'BOS'					,															m(	yy,	$1)									)	}
							|												EOS																{$$	=	c(		yy,	'EOS'					,															m(	yy,	$1)									)	}
	;		repeatable		:												DOT																{$$	=	c(		yy,	'DOT'					,															m(	yy,	$1)									)	}
							|												ESCAPE			ESCAPED											{$$	=	c(		yy,	'escaped'				,										m(	yy,	$1)	,				$2									)	}
							|												STRING															{$$	=	c(		yy,	'string'				,																	$1									)	}
							|												group															{$$	=																											$1										}
							|												class															{$$	=																											$1										}
	;		repetition		:												OPT																{$$	=	c(		yy,	'OPT'					,															m(	yy,	$1)	,								)	}
							|												STAR															{$$	=	c(		yy,	'STAR'					,															m(	yy,	$1)	,								)	}
							|												PLUS															{$$	=	c(		yy,	'PLUS'					,															m(	yy,	$1)	,								)	}
							|												count															{$$	=																											$1										}
	;		count			:		COUNT_OPEN				COUNT_NUMBER									COUNT_CLOSE						{$$	=	c(		yy,		'count'				,	m(	yy,	$1				)		,+			$2	,							m(	yy,	$3			)	)	}
							|		COUNT_OPEN				COUNT_NUMBER	COUNT_COMMA						COUNT_CLOSE						{$$	=	c(		yy,	'min_count'				,	m(	yy,	$1				)		,+			$2	,		m(	yy,	$3)	,		m(	yy,	$4			)	)	}
							|		COUNT_OPEN				COUNT_NUMBER	COUNT_COMMA		COUNT_NUMBER	COUNT_CLOSE						{$$	=	c(		yy,		'count'				,	m(	yy,	$1				)		,+			$2	,		m(	yy,	$3)	,+	$4,	m(	yy,	$5			)	)	}
	;		group			:		CAPTURING_GROUP_OPEN					pattern							GROUP_CLOSE						{$$	=	c(		yy,		'capturing_group'	,	m(	yy,	$1				)		,								$2	,		m(	yy,	$3			)	)	}
							|	NON_CAPTURING_GROUP_OPEN	COLON			pattern							GROUP_CLOSE						{$$	=	c(		yy,	'non_capturing_group'	,	m(	yy,	$1				)	,''	,	m(	yy,	$2)	,				$3	,		m(	yy,	$4			)	)	}
	;		member_atom		:												ESCAPE			ESCAPED											{$$	=	c(		yy,	'escaped'				,										m(	yy,	$1)	,				$2									)	}
							|												MEMBER_CHAR														{$$	=	c(		yy,	'MEMBER_CHAR'			,																	$1									)	}
	;		member_string	:												MEMBER_CHAR														{$$	=																											$1										}
							|								member_string	MEMBER_CHAR														{$$	=																						$1		+			$2										}
	;		member_range	:								member_atom		MEMBER_DASH		member_atom										{$$	=	c(		yy,	'member_range'			,			$1						,						m(	yy,	$2)	,				$3				)	}
	;		member			:		   MEMBER_POSIX_OPEN					member_string					   MEMBER_POSIX_CLOSE			{$$	=	c(		yy,	'member_posix'			,	m(	yy,	$1				)		,								$2	,		m(	yy,	$3			)	)	}
							|		 MEMBER_COLLATING_OPEN					member_string					 MEMBER_COLLATING_CLOSE			{$$	=	c(		yy,	'member_collating'		,	m(	yy,	$1				)		,								$2	,		m(	yy,	$3			)	)	}
							|		MEMBER_EQUIVALENCE_OPEN					MEMBER_CHAR						MEMBER_EQUIVALENCE_CLOSE		{$$	=	c(		yy,	'member_equivalence'	,	m(	yy,	$1				)		,								$2	,		m(	yy,	$3			)	)	}
							|												MEMBER_DASH														{$$	=																											$1										}
							|												member_range													{$$	=																											$1										}
							|												member_atom														{$$	=																											$1										}
	;		members			:												member															{$$	=	c(		yy,	'members'				,																	$1									)	}
							|								members			member															{$1	.push(																										$2									)	}
	;		class			:		NEGATIVE_CLASS_OPEN_WITH_CLOSE			members							CLASS_CLOSE						{$$	=	c(		yy,	'negative_class'		,	m(	yy,	$1.slice(0,-1)	)
																																				,	c(		yy,	'escaped'				,										m(	yy,'\\'),									$1.slice(-1))
																																				,																								...			$2	,		m(	yy,	$3			)	)	}
							|		NEGATIVE_CLASS_OPEN						members							CLASS_CLOSE						{$$	=	c(		yy,	'negative_class'		,	m(	yy,	$1				)		,					...			$2	,		m(	yy,	$3			)	)	}
							|		NEGATIVE_CLASS_OPEN_WITH_CLOSE																			{$$	=	c(		yy,	'negative_class'		,	m(	yy,	$1.slice(0,-1)	)		,											m(	yy,	$1.slice(-1))	)	}
							|		POSITIVE_CLASS_OPEN_WITH_CLOSE			members							CLASS_CLOSE						{$$	=	c(		yy,	'positive_class'		,	m(	yy,	$1.slice(0,-1)	)
																																				,	c(		yy,	'escaped'				,										m(	yy,'\\'),									$1.slice(-1))
																																				,																								...			$2	,		m(	yy,	$3			)	)	}
							|		POSITIVE_CLASS_OPEN						members							CLASS_CLOSE						{$$	=	c(		yy,	'positive_class'		,	m(	yy,	$1				)		,					...			$2	,		m(	yy,	$3			)	)	}
							|		POSITIVE_CLASS_OPEN_WITH_CLOSE																			{$$	=	c(		yy,	'positive_class'		,	m(	yy,	$1.slice(0,-1)	)		,											m(	yy,	$1.slice(-1))	)	}
	;
