#!/usr/bin/env bash
	. "$(dirname "$0")"/_common.sh
	
	input="$tmp/$name".input
	
	:				;if [[ -z $1				]]
	then :			;if ((	permute				))
		then :		;if ((	empty_class_opens	))
###			then :	;set -- '[^]''[]{0,}'																								"${@:2}"	
###			else :	;set -- '[^\[\]]{0,}'																								"${@:2}"	;fi
##			then :	;set -- '(test\te*[-x\-zs-t-])'																						"${@:2}"	
##			else :	;set -- '(test\te*[-x\-zs-t-])'																						"${@:2}"	;fi
#			then :	;set -- 'p[01](a[23]|a[45]|a[67])s[89]'																				"${@:2}"	
#			else :	;set -- 'p[01](a[23]|a[45]|a[67])s[89]'																				"${@:2}"	;fi
			then :	;set -- '^\{\[(?:(\[[^]''[]{0,}\])|(test\te*[-x\-zs-t-])|([+-\-]+)|(\([^()]{1,}\)))]\\}$'							"${@:2}"	
			else :	;set -- '^\{\[(?:(\[[^\[\]]{0,}\])|(test\te*[-x\-zs-t-])|([+-\-]+)|(\([^()]{1,}\)))]\\}$'							"${@:2}"	;fi
		else :		;if ((	empty_class_opens	))
			then :	;set -- '^\{\[(?:(\[[^]''[]{0,}\])|(test\te*[-x\-zs-t-])|([+-\-]+)|(\([^()]{1,}\)))]\\}$'							"${@:2}"	
			else :	;set -- '^\{\[(?:(\[[^\[\]]{0,}\])|(test\te*[-x\-zs-t-])|([+-\-]+)|(\([^()]{1,}\)))]\\}$'							"${@:2}"	;fi;fi;fi
	
	printf %s "$1" > "$input"
	
