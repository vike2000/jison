#!/usr/bin/env bash
	. "$(dirname "$0")"/'Prepare regexp.jison'.sh
	
	out="$tmp/$name".js
	min="$tmp/$name".min.js
	log="$tmp/$name".log
	
#	([[ ! -a "$out" ]]||command rm "$out")
	
	if ! /opt/local/bin/node examples/regexp.js -m "${module_type:-export-js-product}" -o "$out" -t >"$log" "$example".jison
	then cat "$log"
	else
		if grep -q -i conflict "$log"
		then
			case $conflict_handling in(!(*))
				;;&(*[-+]@(cat|dump)|cat|dump|@(cat|dump)[-+]*	)cat "$log"
				;;&(	  *[-+]@(exit)|exit|@(exit)[-+]*		)exit 1
			esac
		fi
##		sed -i '' -E '/symbol = lex\(\);$/s//& console.log((this.terminals_[symbol]||"").padEnd(32),(lexer.yytext||"").padEnd(32))/' "$out"
		((!require_bluelephant_excerpt))||sed -i '' -E "1i\\
			\$b = require('../../$example.bluelephant_excerpt')\\
			" "$out"
		((!	uglifyjs))||
			uglifyjs -m --keep-fnames --source-map "includeSources=true" -o "$min" "$out"
#		fi
	fi