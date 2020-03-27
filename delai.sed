/^## Todo$/,/^#/ {
	s/\[x\]/[Completed  ]/
	s/\[ ?\]/[To do      ]/
	s/\[~\]/[In progress]/
	s/^ *[-\*] *(\[[^]]*\]) *`([^`]*)` *(.*)$/\2 $cours \1 \3/p
}
d
