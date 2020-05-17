# 「=」  遅延評価
# 「:=」 即時評価
# 「?=」値がセットされていないときのみ値を代入
# 「&&」コマンド1 &&　コマンド2。1が終了してから2を行う
# todo: xcpretty

PRODUCT_NAME := Test
SCHEME_NAME := ${PRODUCT_NAME}
PROJECT_NAME := ${PRODUCT_NAME}.xcodeproj
UI_TESTS_TARGET_NAME := ${PRODUCT_NAME}

TEST_SDK := iphonesimulator
TEST_CONFIGURATION := Debug
TEST_PLATFORM := iOS Simulator
TEST_DEVICE ?= iPhone 11 Pro Max
TEST_OS ?= 13.4.1
TEST_DESTINATION := 'platform=${TEST_PLATFORM},name=${TEST_DEVICE},OS=${TEST_OS}'

.PHONY: open
open:
	open ./${PROJECT_NAME}

.PHONY: show-devices
show-devices:
	instruments -s devices

# デバッグビルド
.PHONY: build-debug
build-debug:
	set -o pipefail && \
xcodebuild \
-sdk ${TEST_SDK} \
-configuration ${TEST_CONFIGURATION} \
-project ${PROJECT_NAME} \
-scheme ${SCHEME_NAME} \
build \

# テスト実行
.PHONY: test
test:
	set -o pipefail && \
xcodebuild \
-sdk ${TEST_SDK} \
-configuration ${TEST_CONFIGURATION} \
-project ${PROJECT_NAME} \
-scheme ${SCHEME_NAME} \
-destination ${TEST_DESTINATION} \
clean test \