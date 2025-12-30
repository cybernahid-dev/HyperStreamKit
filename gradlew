#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

# For Darwin, add options to specify how the application appears in the dock
if [ "`uname`" = "Darwin" ]; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
    [ -n "$APP_HOME" ] &&
        APP_HOME=`cygpath --unix "$APP_HOME"`
    [ -n "$JAVA_HOME" ] &&
        JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
    [ -n "$CLASSPATH" ] &&
        CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# Attempt to set JAVA_HOME if it's not already set
if [ -z "$JAVA_HOME" ] ; then
    if [ -r /etc/gentoo-release ] ; then
        JAVA_HOME=`java-config --jre-home`
    fi
fi

# Resolve JAVA_HOME from javac
if [ -z "$JAVA_HOME" ]; then
    javac_exists=true
    if ! [ -x "$(command -v javac)" ]; then
        javac_exists=false
    fi
    if $javac_exists; then
        # readlink -f will resolve symlinks, whereas readlink will not
        # some distributions have javac as a symlink to other tools, for example, on Arch linux it is a symlink to a script which sets up the java version
        java_home_tmp="$(readlink -f "$(command -v javac)")"
        java_home_tmp="$(dirname "$java_home_tmp")"
        java_home_tmp="$(dirname "$java_home_tmp")"
        # if we have a valid JAVA_HOME, we are done
        if [ -d "$java_home_tmp/bin" ]; then
            JAVA_HOME="$java_home_tmp"
        fi
    fi
fi

# Resolve JAVA_HOME from java
if [ -z "$JAVA_HOME" ]; then
    java_exists=true
    if ! [ -x "$(command -v java)" ]; then
        java_exists=false
    fi
    if $java_exists; then
        # readlink -f will resolve symlinks, whereas readlink will not
        # some distributions have java as a symlink to other tools, for example, on Arch linux it is a symlink to a script which sets up the java version
        java_home_tmp="$(readlink -f "$(command -v java)")"
        java_home_tmp="$(dirname "$java_home_tmp")"
        java_home_tmp="$(dirname "$java_home_tmp")"
        # if we have a valid JAVA_HOME, we are done
        if [ -d "$java_home_tmp/bin" ]; then
            JAVA_HOME="$java_home_tmp"
        fi
    fi
fi


# OS specific support.  $var _must_ be set to either true or false.
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NONSTOP* )
    nonstop=true
    ;;
esac

# Set file separator
if $cygwin ; then
    FILE_SEPARATOR=';'
else
    FILE_SEPARATOR=':'
fi

# Find the location of the gradle wrapper jar, from the same directory as this script
if [ -z "$APP_JAR_DIR" ]; then
    APP_JAR_DIR=`dirname "$PRG"`
fi
if [ -z "$APP_JAR" ]; then
    APP_JAR="$APP_JAR_DIR/gradle/wrapper/gradle-wrapper.jar"
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --windows "$APP_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    APP_JAR=`cygpath --path --windows "$APP_JAR"`
    CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
fi

# For MSYS, switch paths to Windows format before running java
if $msys ; then
    APP_HOME=`path -w "$APP_HOME"`
    JAVA_HOME=`path -w "$JAVA_HOME"`
    APP_JAR=`path -w "$APP_JAR"`
    CLASSPATH=`path -w "$CLASSPATH"`
fi


# (see GRADLE-2693)
# (see https://github.com/gradle/gradle/issues/1831)
if $darwin ; then
    if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
        # Use all available file descriptors
        MAX_FD=`ulimit -n`
    fi
    ulimit -n $MAX_FD
fi

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    # Note that in non-stop environments, they have their own limit,
    # so we should not attempt to alter it.
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            # try the hard limit
            MAX_FD="$MAX_FD_LIMIT"
        fi
        if [ -n "$MAX_FD" ] && [ "$MAX_FD" != "unlimited" ]; then
            ulimit -n $MAX_FD
            if [ $? -ne 0 ] ; then
                # If we get an error, it may be because we've tried to set the soft limit
                # above the hard limit. If this is the case, we'll try setting the soft
                # limit to the hard limit instead.
                if [ $MAX_FD -gt $MAX_FD_LIMIT ] ; then
                    ulimit -n $MAX_FD_LIMIT
                fi
            fi
        fi
    fi
fi

# Add the jar to the classpath
CLASSPATH="$APP_JAR"

# Split up the JVM options only if the JAVA_OPTS variable is not empty
if [ -n "$JAVA_OPTS" ]; then
    JVM_OPTS_ARRAY=( $JAVA_OPTS )
fi

# Split up the ANT options only if the GRADLE_OPTS variable is not empty
if [ -n "$GRADLE_OPTS" ]; then
    GRADLE_OPTS_ARRAY=( $GRADLE_OPTS )
fi

# Execute the application and return its exit code
exec "$JAVACMD" "${JVM_OPTS_ARRAY[@]}" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "${GRADLE_OPTS_ARRAY[@]}" "$@"