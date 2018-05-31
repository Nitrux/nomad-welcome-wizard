#include "ShellHelper.h"

#include <QString>
#include <QtConcurrent>

ShellHelper::ShellHelper(QObject* parent) : QObject(parent) {}

void ShellHelper::runCommand(QString cmd) {
  QtConcurrent::run([=]() {
    int returnCode = system(cmd.toStdString().c_str());

    emit cmdComplete(returnCode);
  });
}
