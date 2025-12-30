#!/usr/bin/env sh

# We need to be able to use the 'command' command.
if ! (command -v command >/dev/null 2>&1); then
    echo "Error: 'command' command not found." >&2
    exit 1
fi

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG_UNIX_PATH_REALPATH="$(command -v realpath)"
if [ -z "$PRG_UNIX_PATH_REALPATH" ] ; then
    PRG_UNIX_PATH_REALPATH="realpath"
fi

if [ -x "$(command -v "$PRG_UNIX_PATH_REALPATH")" ]; then
    # With 'realpath' command, it is easier to resolve symlinks
    PRG_ORIG_INVOCATION="$0"
    PRG_SYMLINK_RESOLVED="`"$PRG_UNIX_PATH_REALPATH" \"$0\"`"
    # Get the dirname of the resolved symlink
    APP_HOME_SYMLINK_RESOLVED="`(cd \"\`dirname \"$PRG_SYMLINK_RESOLVED\"\`\" >/dev/null; pwd)`"
else
    # Fallback to the traditional way of resolving symlinks
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
    # Get the dirname of the script
    APP_HOME_SYMLINK_RESOLVED="`(cd \"\`dirname \"$PRG\"\`\" >/dev/null; pwd)`"
fi
APP_HOME="$APP_HOME_SYMLINK_RESOLVED"

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

# OS specific support.  $var _must_ be set to either true or false.
cygwin=false
darwin=false
mingw=false
case "`uname`" in
  CYGWIN*)
    cygwin=true
    ;;
  Darwin*)
    darwin=true
    ;;
  MINGW*)
    mingw=true
    ;;
esac

# Attempt to set JAVA_HOME if it's not already set
if [ -z "$JAVA_HOME" ] ; then
    if [ -d /usr/lib/jvm/java-1.8.0 ] ; then
        export JAVA_HOME=/usr/lib/jvm/java-1.8.0
    elif [ -d /usr/lib/jvm/java-8-openjdk ] ; then
        export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    elif [ -d /usr/lib/jvm/java-8-oracle ] ; then
        export JAVA_HOME=/usr/lib/jvm/java-8-oracle
    else
        java_exists_in_path=$(command -v java)
        if [ "x$java_exists_in_path" != "x" ] ; then
            java_path=$(readlink -f `command -v java`)
            java_path_part_1=$(dirname $java_path)
            java_path_part_2=$(dirname $java_path_part_1)
            export JAVA_HOME=$java_path_part_2
        fi
    fi
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
if [ "$cygwin" = "false" -a "$darwin" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            # Use all available file descriptors
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n $MAX_FD
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    GRADLE_OPTS="-Xdock:name=$APP_NAME -Xdock:icon=\"$APP_HOME/media/gradle.icns\" $GRADLE_OPTS"
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    APP_CLASSPATH=`cygpath --path --mixed "$APP_CLASSPATH"`
    CYGWIN_OPTS=`cygpath --path --mixed "$CYGWIN_OPTS"`
fi

# For MINGW, switch paths to Windows format before running java
if $mingw ; then
    APP_HOME="`(cd \"$APP_HOME\" && pwd -W)`"
    APP_CLASSPATH=`cygpath --path --mixed "$APP_CLASSPATH"`
    CYGWIN_OPTS=`cygpath --path --mixed "$CYGWIN_OPTS"`
fi

# Find the location of the gradle wrapper jar, from the same directory as this script
if [ -z "$APP_JAR_DIR" ]; then
    APP_JAR_DIR=`dirname "$PRG_SYMLINK_RESOLVED"`
fi
if [ -z "$GRADLE_WRAPPER_JAR" ]; then
    GRADLE_WRAPPER_JAR="$APP_JAR_DIR/gradle/wrapper/gradle-wrapper.jar"
fi
# Add the wrapper jar to the classpath
APP_CLASSPATH="$GRADLE_WRAPPER_JAR"

# Build the command line
GRADLE_CMD=("$JAVACMD")
GRADLE_CMD+=($DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS)
GRADLE_CMD+=("-Dorg.gradle.appname=$APP_BASE_NAME")
GRADLE_CMD+=(-classpath "$APP_CLASSPATH")
GRADLE_CMD+=(org.gradle.wrapper.GradleWrapperMain)
GRADLE_CMD+=("$@")

# Start Gradle
exec "${GRADLE_CMD[@]}"