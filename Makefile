.PHONY: all compile clean ct test_deps

all: compile

compile:
	@echo "Fetching dependencies..."
	@rebar3 get-deps
	@echo "Compiling..."
	@rebar3 compile

ct: compile test_deps
	@echo "Running common tests..."
	-@ct_run -noshell \
		-pa _build/default/lib/*/ebin \
		-pa test/_build/default/lib/*/ebin \
		-name test \
		-logdir ./logs \
		-env TEST_DIR ./test \
		-spec ./test/test_specs.spec \
		-dir test >> ./logs/raw.log 2>&1
	@grep -h "TEST COMPLETE" ./logs/raw.log | tail -1

test_deps:
	@echo "Checking dependencies for test..."
	@cd test && rebar3 get-deps && rebar3 compile && cd ..

clean:
	@rebar3 clean
	@cd test && rebar3 clean && cd ..

distclean: clean
	@rm -rf ./_build/ && rm -rf ./test/_build/
