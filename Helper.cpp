#include "Helper.h"

#include <QDebug>
#include <QDir>

Helper::Helper(QObject* parent) : QObject(parent) {
  autostartFile = new QFile(QDir::homePath() +
                            "/.config/autostart/nx-welcome-wizard.desktop");
}

bool Helper::isAutostartEnabled() {
  qDebug() << autostartFile->exists();
  return autostartFile->exists();
}

void Helper::disableAutostart() { autostartFile->remove(); }
