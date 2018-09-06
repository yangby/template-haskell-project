STACK = stack ${STACK_FLAGS}
RM = rm -f

install-dev: install-format-check install-lint-check

install-format-check:
	${STACK} build hindent

install-lint-check:
	${STACK} build hlint

format-check:
	find . -name "*.hs" \
		! -path "./.stack-work/*" \
		-exec ${STACK} exec -- hindent --validate {} \; \
		| grep -c 'is not formatted$$' \
		| xargs -I {} [ {} = 0 ]

format-fix:
	find . -name "*.hs" \
		! -path "./.stack-work/*" \
		-exec ${STACK} exec -- hindent {} \;

lint-check:
	${STACK} exec -- hlint --quiet .

lint-display:
	${STACK} exec -- hlint .

build:
	${STACK} build

test:
	${STACK} test

coverage:
	${STACK} test --coverage

bench:
	${STACK} bench

run%:
	${STACK} exec -- $(@:run%=%)

clean: clean-build

clean-build:
	-${RM} fibonacci.cabal
	-${RM} -r .stack-work
