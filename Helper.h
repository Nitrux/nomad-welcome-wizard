#ifndef HELPER_H
#define HELPER_H

#include <QFile>
#include <QObject>
#include <QString>

class Helper : public QObject {
  Q_OBJECT

 public:
  Helper(QObject* parent = nullptr);

 public slots:
  bool isAutostartEnabled();
  void disableAutostart();

 private:
  QFile* autostartFile;
};

#endif
