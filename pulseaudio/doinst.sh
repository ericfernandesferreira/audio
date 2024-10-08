config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

preserve_perms() {
  NEW="$1"
  OLD="$(dirname ${NEW})/$(basename ${NEW} .new)"
  if [ -e ${OLD} ]; then
    cp -a ${OLD} ${NEW}.incoming
    cat ${NEW} > ${NEW}.incoming
    mv ${NEW}.incoming ${NEW}
  fi
  config ${NEW}
}

config etc/pulse/client.conf.new
config etc/pulse/daemon.conf.new
config etc/pulse/default.pa.new
config etc/pulse/system.pa.new
preserve_perms etc/rc.d/rc.pulseaudio.new

# Make sure the pulse user is in the audio group:
chroot . /usr/sbin/usermod -a -G audio pulse 1> /dev/null 2> /dev/null

# Make sure the root user is in the audio group:
chroot . /usr/sbin/usermod -a -G audio root 1> /dev/null 2> /dev/null

# Recompile glib schemas:
if [ -e usr/share/glib-2.0/schemas ]; then
  if [ -x /usr/bin/glib-compile-schemas ]; then
    /usr/bin/glib-compile-schemas usr/share/glib-2.0/schemas >/dev/null 2>&1
  fi
fi

