#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "ShellHelper.h"

ShellHelper* shellHelper = nullptr;

// static QObject* shellHelperSingletonProvider(QQmlEngine* engine,
//                                             QJSEngine* scriptEngine) {
//  Q_UNUSED(engine)
//  Q_UNUSED(scriptEngine)

//  if (shellHelper == nullptr) {
//    shellHelper = new ShellHelper();
//  }

//  return shellHelper;
//}

int main(int argc, char* argv[]) {
  const char* uri = "org.nxos.welcomewizard";
  QGuiApplication app(argc, argv);

  //  qmlRegisterSingletonType<ShellHelper>(uri, 1, 0, "ShellHelper",
  //  shellHelperSingletonProvider);
  qmlRegisterType<ShellHelper>(uri, 1, 0, "ShellHelper");

  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QQmlApplicationEngine engine;
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
  if (engine.rootObjects().isEmpty())
    return -1;

  return app.exec();
}
