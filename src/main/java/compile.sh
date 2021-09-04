#!/usr/bin/env bash

set -x

if [ -d classes ]; then
    rm -rf classes;
fi
mkdir classes

javac -cp $JAVA_HOME/lib/tools.jar com/iinux/jombok/Getter* -d classes/

javac -cp classes -d classes -processor com.iinux.jombok.GetterProcessor com/iinux/jombok/App.java

javap -p classes com/iinux/jombok/App.class

java -cp classes com.iinux.jombok.App
