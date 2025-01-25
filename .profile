ga() {
find * -name .git -type d \
	| sed 's/\/\.git$//' \
	| sort \
	| xargs -I % bash -c \
		" \
			echo && \
			echo % && \
			git -C % $* \
		"
}