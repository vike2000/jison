#!/usr/bin/env bash
	. "$(dirname "$0")"/_common.sh
	
	json="$tmp/$name".json
	
	cat > "$json"\
	<<-	EOF
		{"permute"						:$((permute*(entities_are_calls?1:2)))
		,"permutations_use_metachars"	:${permutations_use_metachars:-	0}
		,"entities_are_calls"			:${entities_are_calls:-			0}
		,"calls_use_metachars"			:${calls_use_metachars:-		0}
		,"empty_class_opens"			:${empty_class_opens:-			0}
		}
		EOF
	
