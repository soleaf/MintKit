#!/bin/sh

xcodebuild \
	-project mintKit/mintKit.xcodeproj \
	-sdk iphonesimulator \
	-target mintKit-Simulator \
	-configuration Debug \
	clean build \
	ONLY_ACTIVE_ARCH=NO \
	TEST_AFTER_BUILD=YES \
	GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
	GCC_GENERATE_TEST_COVERAGE_FILES=YES 