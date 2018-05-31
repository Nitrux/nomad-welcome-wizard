#ifndef SHELLHELPER_H
#define SHELLHELPER_H

#include <QObject>
#include <QString>

class ShellHelper : public QObject {
  Q_OBJECT

 public:
  ShellHelper(QObject* parent = nullptr);

 public slots:
  void runCommand(QString cmd);

 signals:
  void cmdComplete(int returnCode);
};

#endif
