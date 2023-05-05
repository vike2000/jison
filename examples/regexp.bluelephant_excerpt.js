	//cspell:ignore jsdoc doclet proxcall higginstr
	module.exports = new function bluelephant_tk_excerpt(){
	// excerpt from bluelephant_tk.js verbatim begin
			; /** apply function_ in this_ with argument… and arguments_ from arguments_start
				* *ignore cause-of jsdoc "Failed to find parent of doclet"
				* @ignore
				*/					function	 proxcall	(this_,	arguments_	,function_,arguments_start	,_argument____	){	return Function.prototype.apply.call(								function_,			this_,[].concat(	[].slice.call(	arguments				,4),[].slice.call(arguments_,arguments_start)))}
	// excerpt from bluelephant_tk.js verbatim end
	// excerpt from bluelephant_tk.js verbatim begin
			; /** sets object.__proto__ and returns object. not fully compatible if __proto__ is not modern de facto standard
				* mnemonicy: relating argument order to name protO as variant of proto and reverse backronym of oProt
				* @see $b.oprot for reverse argument order function (oProt)
				* *ignore cause-of jsdoc "Failed to find parent of doclet"
				* @ignore
				*/					function	 proto		(						proto,				object){
				;																						object
				.																  __proto__
				=																	proto		;return	object}
	// excerpt from bluelephant_tk.js verbatim end
	// excerpt from bluelephant_tk.js verbatim begin
			; /** provides class (the old fashioned way) / makes classy (not new like make)
				*/					function	 higgins  (	prototype,			constructor,methods)
				{if(										prototype)			constructor
					.										prototype
					=										prototype
				;for(var																	method
					in																		methods
					)															constructor
					.										prototype
						[																	methods
							[																method].name]
					=																		methods
						[																	method]
				;					return										constructor}
	// excerpt from bluelephant_tk.js verbatim end
				;[								 proxcall
					,							 proto
					, /** mnemonicy: relating argument order to name oProt as variant of protO as variant of proto
						* @see $b.proto for reverse argument order function (protO)
						*/			function	 oprot		(		object,			proto				){ //cspell:ignore oprot
						;											object.		  __proto__
						=															proto
						;return										object}
					,							 higgins
	// excerpt from bluelephant_tk.js verbatim begin
					,				function	     make	(		constructor								,_argument____	){	var	result;			constructor. prototype.		constructor=constructor;if(Object.create)result=Object.create(constructor.prototype);else	if((result={}).__proto__=constructor.prototype,result.__proto__!==constructor.prototype)(result=function(){},result.name=constructor.name,result).prototype=constructor.prototype // name: from applescript's make [new] // the first instruction was (before 220730) $b.dflt but that didn't work in practice and seems wrong in theory, as there always already exists a constructor on any object, right?
						;																																			return(			$b				.proxcall(			result							,	arguments,constructor	,1)||result)} // thanks http://stackoverflow.com/users/157247/t-j-crowder @ http://stackoverflow.com/a/3871769/620603#620603
	// excerpt from bluelephant_tk.js verbatim end
	// excerpt from bluelephant_tk.js verbatim begin
					,				function	 higginstr(			prototype,	name,	constructor,methods) //cspell:ignore higginstr
						{if(									  null!==		name
							&&								 undefined!==		name
							&&	(							  'string'!=typeof	name
								||									  !			name.match(/^\w*$/)) // everyone's so terrified of "evil" eval so we might as well be strict w/ \w*; haha, I even saw `new Function('return '+code)()` in place of `eval(code)` (looking for equivalent of php's stripcslashes) #cspell:ignore stripcslashes
							)throw new Error('Illegal constructor name: '+		name)
						;return					 higgins  (			prototype
						  , (		function					  (				name,	constructor)
							  {		return		 eval	  ('\
								  (	function'+(									name?' '
								  +												name:'')+'\
									(){													constructor	.apply\
									  (						this\
									  , [					this]																.concat([].slice.call(arguments,0)))})')})
							(													name,	constructor)
							,																		methods)}
	// excerpt from bluelephant_tk.js verbatim end
				].reduce(function(m,f){m[f.name]=f;return m},this)}
	