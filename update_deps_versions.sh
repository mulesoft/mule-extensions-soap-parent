#!/bin/sh

updatePropertiesVersion() {
  VERSION_TO_PROPERTY="$1"
  POM_PROPERTY_PATH="$2"

  # PROPERTIES argument should be passed as a literal "arrayName[@]" without $ because here using the ! it is double expanded
  # to obtiain the values and declare again the array.
  PROPERTIES=("${!3}")

  echo "Updating deps in pom: $POM_PROPERTY_PATH"

  for PROPERTY_NAME in "${PROPERTIES[@]}"
  do

      perl -0777 -i -pe "s/(<properties>.*<$PROPERTY_NAME)(.*)(\/$PROPERTY_NAME>.*<\/properties>)/\${1}>$VERSION_TO_PROPERTY<\${3}/s" "$POM_PROPERTY_PATH"
      echo "- Updating property '$PROPERTY_NAME' version to '$VERSION_TO_PROPERTY'"

  done
}

updateParentVersion() {
  VERSION_TO="$1"
  POM_PROPERTY_PATH="$2"

  echo "Updating parent version to $VERSION_TO..."
  perl -0777 -i -pe "s/(<parent>.*<version)(.*)(\/version>.*<\/parent>)/\${1}>$VERSION_TO<\${3}/s" "$POM_PROPERTY_PATH"
}

VERSION_TO=$1
VERSION_TO_MULE=$2

propertiesDeps=("mule.extensions.soap.api")

updatePropertiesVersion "$VERSION_TO" pom.xml propertiesDeps[@]

propertiesDepsMuleVersion=("mule.extensions.soap.support")

updatePropertiesVersion "$VERSION_TO_MULE" pom.xml propertiesDepsMuleVersion[@]

updateParentVersion "$VERSION_TO" pom.xml

