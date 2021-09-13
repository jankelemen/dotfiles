#!/bin/sh

{ [ $# = 0 ] || [ $# -gt 2 ]; } && echo "1. argumnet - module name, 2. - package name (optional)" && exit 1

module_name=$1
[ -n "$2" ] && package_name=$2 || package_name=$module_name

cd "$(pwd)"

[ -d "$module_name" ] && echo "folder with that name already exists" && exit 1

mkdir "$module_name"
cd "$module_name"
go mod init "$module_name"

echo "package $package_name

func Hello() string {
	return \"Hello\"
}" >"$package_name".go

echo "package $package_name

import \"testing\"

func TestHello(t *testing.T) {
	
	t.Run(\"simple 'Hello'\", func(t *testing.T) {
		got := Hello()
		expected := \"Hello\"

		if got != expected {
			t.Errorf(\"expected %q but got %q\", expected, got)
		}
	})

}" >"$package_name"_test.go

