#!/usr/bin/env bash
	. "$(dirname "$0")"/_common.sh
	
	input="$tmp/$name".input
	
	if ((empty_class_opens))
	then printf %s '^\{\[(?:(\[[^]''[]{0,}\])|(test\te*[-x\-zs-t-])|([+-\-]+)|(\([^()]{1,}\)))]\\}$' > "$input"
	else printf %s '^\{\[(?:(\[[^\[\]]{0,}\])|(test\te*[-x\-zs-t-])|([+-\-]+)|(\([^()]{1,}\)))]\\}$' > "$input"
	fi
	
