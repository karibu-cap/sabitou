#!/bin/bash

# Generate DartEnvironmentVariables.xcconfig from dart defines.

# Use dev as the default environment.
APP_ENVIRONMENT="dev"
APP_NAME="Sabitou.DEV"

# Starting Flutter 2.2, dart-define values are base64 encoded.
function entry_decode() { echo "${*}" | base64 --decode; }

IFS=',' read -r -a define_items <<< "$DART_DEFINES"

for index in "${!define_items[@]}"
do
    define_items[$index]=$(entry_decode "${define_items[$index]}");

    # Get the property name and the property value.
    field="${define_items[$index]%=*}"
    value="${define_items[$index]#*=}"

    if [ "$field" == "APP_ENVIRONMENT" ]; then
        APP_ENVIRONMENT=${value}
    fi
done

cp ${SRCROOT}/Runner/Services/${APP_ENVIRONMENT}/EnvironmentVariables.xcconfig ${SRCROOT}/Flutter/DartEnvironmentVariables.xcconfig
printf "APP_ENVIRONMENT=%s\n" "${APP_ENVIRONMENT}" >> ${SRCROOT}/Flutter/DartEnvironmentVariables.xcconfig
printf "APP_NAME=%s\n" "${APP_NAME}" >> ${SRCROOT}/Flutter/DartEnvironmentVariables.xcconfig
printf "%s\n" "${define_items[@]}" >> ${SRCROOT}/Flutter/DartEnvironmentVariables.xcconfig
